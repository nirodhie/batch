set /p NazwaUzytkownika = Podaj imie i nazwisko uzytkownika ktorego chcesz znalezc: 
dsquery user "OU=EMEA,OU=BDUsers,DC=BDX,DC=com" -name "%NazwaUzytkownika%" |  dsget user  -display
pause