/////////////////////////////////////////////////////////////////////
//
// CFX_DIRECTORYLIST - Cold Fusion custom tag which enumerates
//		   the contents of a specified directory.
//
// ADOBE SYSTEMS INCORPORATED
//  Copyright 1996 Adobe Systems Incorporated
//  All Rights Reserved.
// 
// NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the 
// terms of the Adobe license agreement accompanying it.  If you have received this file from a 
// source other than Adobe, then your use, modification, or distribution of it requires the prior 
// written permission of Adobe.
//
//
// This tag enumerates the contents of the directory specified 
// in the DIRECTORY attribute and returns the information as 
// a query with the name specified in the NAME attribute. The
// columns in the query include: Type, Name, Date, and Size.
//
// Example Use:
//
//	<CFX_DIRECTORYLIST NAME="RootDir" DIRECTORY="C:\"> 
//
//  <CFOUTPUT QUERY="RootDir"> 	
//		(#Type#) #Name# - #Date# #Size# <BR>
//	</CFOUTPUT>
//
//
// NOTE: If you wish to experiment with this tag from within
//		 Cold Fusion you need to add it to the registry of
//		 custom tags using the Cold Fusion Administrator.
//

#if defined(sun)
#define _POSIX_PTHREAD_SEMANTICS
#endif

#include <stdio.h>
#include <sys/file.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/param.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <time.h>

#include "cfx.h"		// CFX Custom Tag API


// Constants
#define TAG_ERROR_HEADER	"Error occurred in CFX_DIRECTORYLIST tag"

// Forward declarations for helper functions
LPCSTR GetRequiredAttribute( CCFXRequest* pRequest, LPCSTR lpszAttribName ) ;

extern "C"
void ProcessTagRequest( CCFXRequest* pRequest ) 
{
	try
	{
		// Get the DIRECTORY attribute (determines which directory to query)
		LPCSTR lpDirectory = GetRequiredAttribute( pRequest, "DIRECTORY" ) ;

		// Get the NAME attribute (determines what to name the query we return)
		LPCSTR lpName = GetRequiredAttribute( pRequest, "NAME" ) ;
		
		// Create a query object to return to the client
		CCFXStringSet* pColumns = pRequest->CreateStringSet() ;
		int iType = pColumns->AddString("TYPE") ;
		int iName = pColumns->AddString("NAME") ;
		int iDate = pColumns->AddString("DATE") ;
		int iSize = pColumns->AddString("SIZE") ;
		CCFXQuery* pQuery = pRequest->AddQuery( lpName, pColumns ) ;

		// Iterate over all of the files in the directory and create
		// a row in the query for each one

		DIR *dirp;
		struct dirent *direntp;
		struct stat StatBuf;

		dirp = opendir( lpDirectory );
	
		if (dirp == NULL)
		{
			return ;
		}

		char lpFullPath[MAXPATHLEN + MAXNAMLEN + 2];

		// Should use readdir_r for thread safty here...
		while ( (direntp = readdir( dirp )) != NULL )
		{
			if ( ( strcmp( direntp->d_name, "." ) == 0 )
				|| ( strcmp( direntp->d_name, ".." ) == 0) )
			{
				continue;
			}

			sprintf(lpFullPath,"%s/%s", lpDirectory, direntp->d_name);
			if (stat(lpFullPath, &StatBuf) < 0)
			{
				// can't stat - just skip it
				continue;
			}

 			// Add a row to the query for this file
			int iRow = pQuery->AddRow() ;

			// Determine the type
			if (S_ISDIR(StatBuf.st_mode))
			{
				// Directory
				pQuery->SetData( iRow, iType, "Directory" ) ;
			}
			else
			{
				// File
				pQuery->SetData( iRow, iType, "File" ) ;
			}

			// Set the file name
			pQuery->SetData( iRow, iName, direntp->d_name ) ;

			// Set the file date
			//char *lpDate = ctime(&StatBuf.st_mtime);
			char pBuf[1024];
			ctime_r(&StatBuf.st_mtime, pBuf);
			pQuery->SetData( iRow, iDate, pBuf ) ;

			// Set the file size
			char lpSize[1024] ;
			sprintf(lpSize, "%ld", StatBuf.st_size);
			pQuery->SetData( iRow, iSize, lpSize ) ;

		}

		(void)closedir( dirp );
	}

	// Catch Cold Fusion exceptions & re-raise them
	catch( CCFXException* e )
	{
		pRequest->ReThrowException( e ) ;
	}
	
	// Catch ALL other exceptions and throw them as 
	// Cold Fusion exceptions (DO NOT REMOVE! -- 
	// this prevents the server from crashing in 
	// case of an unexpected exception)
	catch( ... )
	{
		pRequest->ThrowException( 
			TAG_ERROR_HEADER,
			"Unexpected error occurred while processing tag." ) ;
	}
}


// Get the value for the passed attribute (throw an exception
// if the attribute was not passed to the tag)
LPCSTR GetRequiredAttribute( CCFXRequest* pRequest, LPCSTR lpszAttribName ) 
{
	// Verify that the attribute exists (throw an exception
	// if it does not)
	if ( !pRequest->AttributeExists(lpszAttribName) )
	{
		char Err[1024];
		sprintf(Err, 
				"The required attribute %s was not passed to the tag. ",  
				lpszAttribName);
		pRequest->ThrowException( TAG_ERROR_HEADER, Err ) ;	
	}

	// Return the attribute
	return pRequest->GetAttribute( lpszAttribName ) ;	
}
