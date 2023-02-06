program PapiTwo;

// Usar el modo ObjectFreePascal
{$mode objfpc}{$H+}

uses
Classes, SysUtils, fpjson, jsonparser;

var
   URL            : string; // URL de la REST API a consumir.
   OutputFile     : string; // Nombre del archivo de salida.
   SaveToFile     : boolean; // Indica si se debe guardar en un archivo.
   JSONResponse   : TJSONData; // JSON que contiene la respuesta de la API.
   ResponseStream : TStringStream; // Stream que tiene la respuesta de la API.
   HttpClient     : TFPHTTPClient; // Cliente HTTP para consumir la API.

begin
   URL := 'http://localhost:8090';
   OutputFile := 'response.json';
   SaveToFile := true;
   HttpClient := TFPHTTPClient.Create(nil);

   // Excepciones para evitar un cagadero de red
   try
   ResponseStream := TStringStream.Create(HttpClient.Get(URL));
   try
   JSONResponse := GetJSON(ResponseStream.DataString);

   if SaveToFile then
   begin
      JSONResponse.SaveToFile(OutputFile);
      writeln('Archivo guardado en: ', OutputFile);
   end
   else
       begin
           writeln(JSONResponse.AsJSON);
        end;
   finally
       ResponseStream.Free;
    end;
    finally
        HttpClient.Free;
    end;
end.
