/*zestaw 3.1*/

/*1*/
SELECT 
    MAX(kwota)
FROM
    bank2021.lokata

/*2*/
SELECT 
    COUNT(*) AS liczbaLokat,
    IF(dataZamkniecia IS NULL,
        'otwarta',
        'zamknieta') AS czyZamkniete
FROM
    bank2021.lokata
GROUP BY czyZamkniete

/*3*/
SELECT 
    idKlienta,
    COUNT(*) AS LiczbaLokat,
    GROUP_CONCAT(nrLokaty) AS Numer
FROM
    bank2021.lokata
GROUP BY idKlienta

/*4*/
SELECT 
    k.idKlienta,
    k.imie,
    k.nazwisko,
    k.adres,
    COUNT(l.idKlienta) AS liczbaLokat
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.lokata l USING (idKlienta)
GROUP BY k.idKlienta
HAVING liczbaLokat > 1

SELECT 
    *
FROM
    bank2021.klient k
        LEFT JOIN
    bank2021.lokata l USING (idKlienta)

/*5*/
SELECT 
    l.idKlienta, COUNT(l.idKlienta) AS liczbaLokat
FROM
    bank2021.lokata l
WHERE
    l.kwota BETWEEN 10000 AND 50000
GROUP BY l.idKlienta
HAVING liczbaLokat > 1

/*6*/
SELECT 
    l.idKlienta, MAX(l.kwota) AS maksKwota
FROM
    bank2021.lokata l
GROUP BY l.idKlienta
ORDER BY maksKwota

/*7*/
SELECT 
    SUM(kwota) AS kwota,
    idKlienta,
    CASE
        WHEN dataZamkniecia IS NULL THEN 'Lokata aktualna'
        ELSE 'Lokata zamknięta'
    END AS rodzaj
FROM
    bank2021.lokata
GROUP BY idKlienta , rodzaj

/*8*/
SELECT 
    stanowisko, COUNT(idPracownika) AS ilość
FROM
    bank2021.pracownik
GROUP BY stanowisko

/*9*/
SELECT 
    idPracownika,
    p.imie,
    p.nazwisko,
    p.stanowisko,
    COUNT(k.idKlienta) AS ilość
FROM
    bank2021.pracownik p
        LEFT JOIN
    bank2021.klient k ON k.idOpiekuna = p.idPracownika
GROUP BY idPracownika
ORDER BY ilość

SELECT 
    idOpiekuna, COUNT(idKlienta)
FROM
    bank2021.klient
GROUP BY idOpiekuna

/*10*/
SELECT 
    o.nazwaOddzialu, k.imie, k.nazwisko
FROM
    bank2021.oddzialBanku o
        LEFT JOIN
    bank2021.konto ko USING (nazwaOddzialu)
        LEFT JOIN
    bank2021.konto_klienta kk USING (nrKonta)
        LEFT JOIN
    bank2021.klient k USING (idKlienta)

/*11*/
SELECT 
    nrKonta,
    SUM(kwota) suma,
    CASE
        WHEN o.kwota > 0 THEN 'wpłata'
        ELSE 'wypłata'
    END AS rodzaj
FROM
    bank2021.konto k
        LEFT JOIN
    bank2021.operacja o USING (nrKonta)
GROUP BY nrKonta , rodzaj

/*12*/
SELECT 
    l.idKlienta, k.nazwisko
FROM
    bank2021.lokata l
        LEFT JOIN
    bank2021.klient k USING (idKlienta)
WHERE
    l.kwota = (SELECT 
            MAX(l.kwota)
        FROM
            bank2021.lokata)

/*13*/
SELECT 
    l.idKlienta, l.nrLokaty
FROM
    bank2021.lokata l
WHERE
    l.kwota IN (SELECT 
            MAX(l.kwota)
        FROM
            bank2021.lokata l
        GROUP BY l.idKlienta)

/*14*/
SELECT 
    MAX(p.liczbaLokat)
FROM
    (SELECT 
        COUNT(*) AS liczbaLokat
    FROM
        bank2021.lokata l
    GROUP BY l.idKlienta) p

/*15*/
SELECT 
    idKlienta
FROM
    (SELECT 
        COUNT(nrLokaty) AS ilość, idKlienta
    FROM
        bank2021.lokata
    GROUP BY idKlienta) p
WHERE
    ilość = (SELECT 
            MAX(ilość)
        FROM
            (SELECT 
                COUNT(nrLokaty) AS ilość, idKlienta
            FROM
                bank2021.lokata
            GROUP BY idKlienta) p)

/*16*/
SELECT 
    kwota, nrOperacji
FROM
    (SELECT 
        MAX(kwota) AS kwota, nrOperacji
    FROM
        bank2021.operacja
    GROUP BY nrOperacji) P
WHERE
    kwota = (SELECT 
            MAX(kwota) AS kwota
        FROM
            bank2021.operacja)
     


/*17*/
SELECT 
    idKlienta, imie, nazwisko
FROM
    bank2021.klient
WHERE
    idKlienta = (SELECT 
            idKlienta
        FROM
            (SELECT 
                MAX(kwota) AS kwota, idKlienta
            FROM
                bank2021.operacja
            GROUP BY idKlienta) AS p
        WHERE
            kwota = (SELECT 
                    MAX(kwota)
                FROM
                    (SELECT 
                        MAX(kwota) AS kwota, idKlienta
                    FROM
                        bank2021.operacja
                    GROUP BY idKlienta) AS p))


/*18*/
SELECT 
    p.idPracownika, p.imie, p.nazwisko
FROM
    bank2021.pracownik p
WHERE
    idPracownika = (SELECT 
            idOpiekuna
        FROM
            (SELECT 
                k.idOpiekuna, COUNT(k.idKlienta) AS ilosc
            FROM
                bank2021.klient k
            WHERE
                k.idOpiekuna IS NOT NULL
            GROUP BY k.idOpiekuna) AS p
        WHERE
            ilosc = (SELECT 
                    MAX(p.ilosc)
                FROM
                    (SELECT 
                        k.idOpiekuna, COUNT(k.idKlienta) AS ilosc
                    FROM
                        bank2021.klient k
                    WHERE
                        k.idOpiekuna IS NOT NULL
                    GROUP BY k.idOpiekuna) AS p))
          
/*19*/
SELECT 
    YEAR(dataOtwarcia) AS Rok,
    nrKonta
FROM
    bank2021.konto
WHERE
    dataOtwarcia IN (SELECT 
            MIN(dataOtwarcia)
        FROM
            bank2021.konto
        GROUP BY YEAR(dataOtwarcia))
        
/*20*/
SELECT 
    k.idKlienta, k.imie, k.nazwisko
FROM
    bank2021.klient k
WHERE
    (SELECT 
            MAX(liczbaOperacji)
        FROM
            (SELECT 
                COUNT(o.nrOperacji) AS liczbaOperacji
            FROM
                bank2021.klient k
            LEFT JOIN bank2021.operacja o USING (idKlienta)
            GROUP BY k.idKlienta) AS p)










