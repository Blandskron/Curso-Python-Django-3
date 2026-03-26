function sendEmails() {
   var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName("Emails");
   var dataRange = sheet.getDataRange();
   var data = dataRange.getValues();

   for (var i = 1; i < data.length; i++) {
     var emailAddress = data[i][0];
     var name = data[i][1]; // Obteniendo el nombre de la columna B
     var codigo = data[i][2]; // Obteniendo el código de la columna C

     var template = HtmlService.createTemplateFromFile('Mensaje');
     template.nombre = name; // Pasando el nombre a la plantilla
     template.codigo = codigo; // Pasando el código a la plantilla

     var message = template.evaluate().getContent();
     var subject = "Descuento 60%"; // Usando el nombre en el asunto también

     MailApp.sendEmail(emailAddress, subject, "", {htmlBody: message});
   } 
}

