#target Photoshop;

var appRef = app;
var originalRulerUnits = appRef.preferences.RulerUnits;
appRef.preferences.RulerUnits = 1;
var docRef, artLayerRef, textItemRef;
var rows = new Array();
rows[1]=" !\"#$%&'()";
rows[2]="*+,-./0123";
rows[3]="456789:;<=";
rows[4]=">?@ABCDEFG";
rows[5]="HIJKLMNOPQ";
rows[6]="RSTUVWXYZ[";
rows[7]="\]^_`abcde";
rows[8]="fghijklmno";
rows[9]="pqrstuvwxy";
rows[10]="z{|}~·TOv ";

rows[11]="Çüéâäàåçêë";
rows[12]="èïîìÄÅÉæÆ?";
rows[13]="öòûùÿÖÜ¢£¥";
rows[14]="PƒáíóúñÑªº";
rows[15]="¿¬¬½¼¡«»aß";
rows[16]="GpSsµtFTOd";
rows[17]="8fen=±==()";
rows[18]="÷˜°··vn²€ ";


var fontname="Comics";

docRef = appRef.documents.add(512, 1024, 72, "CP850 " + fontname, NewDocumentMode.RGB, DocumentFill.TRANSPARENT);
//' Create a new art layer containing text
var colorObj=new SolidColor();
colorObj.rgb.red=255;
colorObj.rgb.green=255;
colorObj.rgb.blue=255;

//' Set the contents of the text layer.
for(var i=1; i<=18;i++){
   for(var j=1; j<=10; j++){
     var artLayerRef = docRef.artLayers.add();
     artLayerRef.kind = LayerKind.TEXT;
     var textItemRef = artLayerRef.textItem;
//     ' textItemRef.Font = fontname
     textItemRef.color=colorObj;
     textItemRef.justification = Justification.CENTER;
     textItemRef.font = "A Charming Font";
     textItemRef.size = 38;
     textItemRef.contents = rows[i].charAt(j);
     textItemRef.position = Array((j-1)*51.2+25,i*51.2-7);
  }
}
//' Restore unit settingPhotoshop CS3
appRef.preferences.RulerUnits = originalRulerUnits;
