{$MODE OBJFPC} {$H+}
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

function GetUrl(url: string): string;
begin
with TFPHTTPClient.Create(nil) do
    try
        GetUrl:= Get(url);
    finally
        Free;
    end;
end;

function PostUrl(url: string): string;
begin
    writeLn('Todo');
end;


var
    { API url to evaluate (http only) }
    Url: string;
    { HTTP request result }
    Res: string;
    { Request header }
    Header: string = 'application/json';

begin
    if paramCount() < 2 then
        begin
            writeLn('Usage: ' + 'papitwo <method> http://<rest_url>/' + #10);
            exit;
        end;


end.


