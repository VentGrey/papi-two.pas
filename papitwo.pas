program PapiTwo;

{
   Copyright (C) 2022  Purata Funes, Omar Jair <ventgrey@gmail.com>
   Author: Purata Funes, Omar Jair <ventgrey@gmail.com>

   This program is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2
   of the License, or (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 }

uses
    SysUtils,
    Classes,
    fphttpclient;

{ Definiciones de funciones }

{ Función para obtener un JSON }
function UrlGet(Url: string): string;
begin
    with TFPHTTPClient.Create(nil) do
    try
        ReadUrl := Get(url);
    finally
        Free;
    end;
end;

var
    { API url to evaluate (http only) }
    Url: string;
    { HTTP request result }
    Res: string;


begin
    if paramCount() < 1 then
        begin
            writeLn('Usage: ' + #10#10 + 'papitwo http://<rest_url>/' + #10);
            exit;
        end;
end.


