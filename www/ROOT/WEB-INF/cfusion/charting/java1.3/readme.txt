Enabling charting on a 1.3.x JVM.

1)  Add java2d.zip to your boot classpath.  This can be done by specifying the Xbootclasspath JVM parameter (replace {cf_root} with your ColdFusion root directory path):

	-Xbootclasspath/a:{cf_root}/charting/java1.3/java2d.zip

2)  Define graphics environment property (java.awt.graphicsenv) as com.gp.java2d.ExGraphicsEnvironment:

	-Djava.awt.graphicsenv=com.gp.java2d.ExGraphicsEnvironment

3) copy the ArialUnicodeMS.fft file to {cf_root}/lib/fonts.  If the directory does not exist create it. 

 