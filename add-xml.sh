#!/bin/bash


for x in src/*.abap; do
  cp $x ${x%.*}.xml
done


for x in src/*.xml; do
  clsname=$(basename "$x" .intf.xml)
  clsnameUPPER=`echo $clsname | tr a-z A-Z`
  printf '\xEF\xBB\xBF' > $x
  echo '<?xml version="1.0" encoding="utf-8"?>' >> $x
  echo '<abapGit version="v1.0.0" serializer="LCL_OBJECT_INTF" serializer_version="v1.0.0">' >> $x
  echo ' <asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">' >> $x
  echo '  <asx:values>' >> $x
  echo '   <VSEOINTERF>' >> $x
  echo '    <CLSNAME>'$clsnameUPPER'</CLSNAME>' >> $x
  echo '    <LANGU>E</LANGU>' >> $x
  echo '    <DESCRIPT>ABAP file format types</DESCRIPT>' >> $x
  echo '    <EXPOSURE>2</EXPOSURE>' >> $x
  echo '    <STATE>1</STATE>' >> $x
  echo '    <UNICODE>X</UNICODE>' >> $x
  echo '   </VSEOINTERF>' >> $x
  echo '  </asx:values>' >> $x
  echo ' </asx:abap>' >> $x
  echo '</abapGit>' >> $x
done


