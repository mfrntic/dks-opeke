# Dokumentacija sustava za praćenje stanja drvenastih jedinki

## Sadržaj
- [Struktura atributa](#struktura-atributa)
- [Grupe atributa](#grupe-atributa)
  - [1. Dimenzije](#1-dimenzije)
  - [2. Pridanak](#2-pridanak)
  - [3. Deblo](#3-deblo)
  - [4. Krošnja](#4-krošnja)
  - [5. Opće stanje](#5-opće-stanje)
  - [6. Preporuke](#6-preporuke)
- [Konvencije i napomene](#konvencije-i-napomene)

## Struktura atributa
Atributi su organizirani u 6 glavnih grupa sa sljedećom strukturom:
- **Naziv atributa**
- **Tip podatka** (bool/text/double)
- **Dopuštene vrijednosti** (ako postoje)

## Grupe atributa

### 0. Bazni atributi
- **ID** (unique identifier - UID)
- **Datum mjerenja** (date)
- **Vrijeme mjerenja** (time)
- **Lokacija** (location - geometry WKT feature - point, line, polygon - uglavnom point)
- **Korisnik** (user)
- **Botanička vrsta** (botanical species)

### 1. Dimenzije
Parametri fizičkih dimenzija stabla

| Atribut | Tip | Opis | Dostupne vrijednosti |
|---------|-----|------|----------------------|
| Promjer | double | Promjer stabla u metrima | - |
| Visina | double | Ukupna visina stabla | - |
| Baza krošnje | double | Promjer baze krošnje | - |
| Radius krošnje | double | Radijus širenja krošnje | - |

### 2. Pridanak
Karakteristike prizemnog dijela stabla

| Atribut | Tip | Opis | Vrijednosti |
|---------|-----|------|-------------|
| Uredno | bool | Stanje održavanja | Da/Ne |
| Trulež | enum | Stupanj truleži | Mala, Srednja, Jaka |
| Mehaničke ozljede | enum | Vrsta oštećenja | Svježe, Stare, Dobro kalusiraju, Loše kalusiraju |
| Hipertrofije | enum | Prisutnost izraslina | Benigne, Upitne |
| Gljiva | enum | Vrsta gljivične infekcije | Phellinus pini, Ganoderma sp., Innotus sp., Phomopsis sp.,... |
| Kukci | enum | Vrste štetnika | Mravi, Ksilofagi, Potkornjaci, Defolijator... |
| Kolizija sa infrastrukturom | bool | Sukob s građevinama | Da/Ne |

### 3. Deblo
Karakteristike debla

| Atribut | Tip | Opis | 
|---------|-----|------|
| Nagnuto | bool | Nagib stabla |
| Suncožar | bool | Oštećenja od sunca |
| Životinjska niša | bool | Prisutnost životinjskih nastambi |
| Kolizija unutarnja | bool | Unutarnje strukturalne nelagodice |

### 4. Krošnja
Karakteristike krošnje

| Atribut | Tip | Opis | Vrijednosti |
|---------|-----|------|-------------|
| Oblik | enum | Oblik krošnje | Cilindrična, Elipsoidna, Sferična... |
| Suhe i trule grane | bool | Količina oštećenih grana | Malo, Puno |
| Prorijeđena | bool | Prorijeđenost krošnje | Da/Ne |
| Lom grane | bool | Prisutnost slomljenih grana | Da/Ne |

### 5. Opće stanje
Globalna evaluacija i vitalitet

| Atribut | Tip | Opis | Vrijednosti |
|---------|-----|------|-------------|
| Vitalitet | enum | Vitalnost stabla | Vrlo dobar, Dobar, Srednji, Narušen, Loš, Vrlo loš |
| TRAQ prije sanacije | enum | Razina rizika prije intervencije | Malen, Umjeren, Visok, Ekstreman |
| TRAQ nakon sanacije | enum | Očekivani rizik nakon intervencije | Malen, Umjeren, Visok, Ekstreman |
| Bonitet | enum | Kvalitativna ocjena | 1, 2, 3, 4, 5 |

**Skala vitaliteta:**
| Vrijednost | Opis |
|------------|-------|
| Vrlo dobar | Nema vidljivih oštećenja |
| Dobar | Manja oštećenja bez utjecaja na vitalnost |
| Srednji | Primjetan gubitak vitalnosti |
| Narušen | Potrebna redovita kontrola |
| Loš | Visok rizik od propadanja |
| Vrlo loš | Krajnje loše stanje |

### 6. Preporuke
Preporučene intervencije

| Atribut | Tip | Opis | Vrijednosti |
|---------|-----|------|-------------|
| Prorijediti | enum | Postotak prorjeđivanja | 10%, 20%, 30%, 40% |
| Hitno | bool | Hitnost intervencije | Da/Ne |
| Sidriti | bool | Potreba za stabilizacijom | Da/Ne |

## Konvencije i napomene
1. **Tipovi podataka:**
   - `bool`: Binarna vrijednost (Da/Ne)
   - `double`: Decimalni broj za metričke vrijednosti
   - `enum`: Lista dopuštenih vrijednosti u JSON formatu

2. **Primjer enum strukture:**
```json
{
"vitalitet": [
    {"value": "Vrlo dobar", "text": "Vrlo dobar"},
    {"value": "Dobar", "text": "Dobar"},
    {"value": "Srednji (oslabljen)", "text": "Srednji (oslabljen)"},
    {"value": "Narušen (potrebno pratiti)", "text": "Narušen (potrebno pratiti)"},
    {"value": "Loš", "text": "Loš"},
    {"value": "Vrlo loš", "text": "Vrlo loš"},
    {"value": "Nepoznat / Nije specificiran", "text": "Nepoznat / Nije specificiran"}
    ]
}
```

3. **Evaluacijski parametri:**
   - TRAQ klasifikacija koristi 4-stupanjsku ljestvicu rizika
   - Vitalitet i bonitet su komplementarne mjere zdravstvenog stanja

4. **Strukturalne napomene:**
   - Svi atributi s enum tipom imaju definiranu listu dopuštenih vrijednosti
   - Boolean atributi nemaju dodatne parametre

5. **Digitalizacija procesa:**
   - Atributi su dizajnirani za korištenje u mobilnoj aplikaciji za terensko prikupljanje podataka koja će biti izrađena za prikupljanje podataka na terenu 
   - Podaci će se automatski sinkronizirati s centralnom bazom podataka
   - Digitalni pristup eliminira potrebu za papirnatim obrascima i ručnim prepisivanjem podataka
   - Struktura atributa osigurava konzistentnost i točnost prikupljenih podataka