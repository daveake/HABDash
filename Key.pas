
function Decrypt(Value : String) : String;
var
    i: integer;
begin
    for i := Length(Value) div 2 downto 1 do begin
        Result := Result + Char(255-(StrToIntDef('$' + Copy(Value, i*2-1, 2), 0)));
    end;
end;

function GoogleMapsAPIKey: String;
var
    EncryptedKey: String;
begin
    EncryptedKey := '90CBAEB195A593BACCB49990A98AB8B98EB7CBCECD99BDABCB9D9CCF8BA9A89EBC86AC9E85B6BE';

    Result := Decrypt(EncryptedKey);
end;
