program PapiTwo;

// Usar el modo ObjectFreePascal
{$mode objfpc}{$H+}

uses
    Classes, SysUtils, fpjson, jsonparser, fphttpclient;

var
   URL            : string; // URL de la REST API a consumir.
   OutputFile     : string; // Nombre del archivo de salida.
   SaveToFile     : boolean; // Indica si se debe guardar en un archivo.
   JSONResponse   : TJSONData; // JSON que contiene la respuesta de la API.
   ResponseStream : TStringStream; // Stream que tiene la respuesta de la API.
   HttpClient     : TFPHTTPClient; // Cliente HTTP para consumir la API.

begin
   // Leer los parámetros de la línea de comandos.
   if ParamCount < 1 then
      begin
         writeln('Uso: ', ParamStr(0), ' URL [Archivo]');
         halt(1);
      end;
   end.

   // Asignar URL al valor del primer parámetro.
   URL := ParamStr(1);

   // Argumentos con dependencia. (OutputFile depende de SaveToFile)
   if ParamCount > 1 then
      begin
         OutputFile := ParamStr(2);
         SaveToFile := true;
      end
   else
      begin
         SaveToFile := false;
   end;

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
