To generate CF Admin Help:
1. Check out all the files from the faramir server in 
   depot\ColdFusion\cf_main\cfusion\wwwroot\CFIDE\administrator\help. 
2. In RoboHelp, open the Help project, which is located on the theoden server in 
   depot\EN\Docs\ColdFusion\scorpio\adminonlinehelp\CFAdminHelp.mpj. 
3. Make any changes necessary, then select File > Generate Primary Layout. 
4. In the Select Output Folder and Start Page text box, enter: 
   depot\ColdFusion\cf_main\cfusion\wwwroot\CFIDE\administrator\help\CFAdminHelp.htm 
   (where the directory is the local directory into which you check out the files from PerForce.) 
5. Specify Welcome.htm as the default page. 
6. Select Finish. 
7. Copy the files just generated to the local CF wwwroot\CFIDE\administrator\help directory 
   to test the Help. 
8. Check the files from
   depot\ColdFusion\cf_main\cfusion\wwwroot\CFIDE\administrator\help\CFAdminHelp.htm
   into PerForce. 

To add a new topic:

1. Follow steps above.
2. Copy any depot\ColdFusion\cf_main\cfusion\wwwroot\CFIDE\administrator\help\cfm_*.htm
   file to a new file named cfm_newtopic.htm, in which you replace "newtopic" with the 
   name of the topic. See existing files as a guide for names. (I'll keep using newtopic
   in these instructions, just for clarity.)
3. At the end of the cfm_newtopic.htm file, there is a line that says src="something.htm"
   in which the "something" points to the corresponding page in the CF Admin. This is 
   different for each cfm*.htm file. Edit this by changing "something" to the page in 
   the Admin, for example src="flex_data_service.htm". You can figure out the page names 
   by looking in the source tree on faramir in 
   depot\ColdFusion\cf_main\cfusion\wwwroot\CFIDE\administrator.
3. Check in this new cfm_newtopic.htm file.
4. Check out depot\ColdFusion\cf_main\cfusion\wwwroot\CFIDE\administrator\topnav.cfm.
5. Open topnav.cfm (NotePad is preferred here) and find the comment that 
   identifies the section of the Administrator that has the new page, 
   for example // Server Monitoring.
6. Copy an existing line, for example:
   helpArray["monitor/monitor.cfm"] = "cfm_server_monitoring.htm";
   and paste it to the appropriate place.
7. Change "monitor/monitor.cfm" to the name of the CF Admin page for which you 
   just created the new Help.
8. Change "cfm_server_monitoring.htm" to the name of the new cfm*.htm topic, 
   for example "cfm_newtopic.htm".
9. Save topnav.cfm and check it in.

You'll want to check to make sure this works. Just copy topnav.cfm and the new cfm_*.htm file to your local copy of ColdFusion, in the corresponding directories, open the CF Admin, and click the Help icon to make sure the new Help page opens. 
