# Dokumentacija baze podataka: Zeleni Katastar 🌳

## Opis baze podataka
Baza podataka **Zeleni Katastar** služi za pohranu i upravljanje informacijama o stablima, njihovim vrstama, zdravstvenom stanju, mjerama održavanja i drugim relevantnim podacima.

---

## Struktura baze podataka

### 📌 Tablice i njihova namjena:

| Tablica | Opis |
|---------|------|
| `drvenaste_vrste` | Popis drvenastih vrsta stabala s njihovim znanstvenim i hrvatskim nazivima. |
| `trulez` | Klasifikacija stupnjeva truleži stabala. |
| `mehanicke_ozljede` | Vrste mehaničkih ozljeda na stablima. |
| `hipertrofije` | Vrste hipertrofija (benigne ili maligne). |
| `gljive` | Popis gljiva koje mogu napasti stabla. |
| `kukci` | Popis kukaca koji mogu napasti stabla. |
| `plodista_truleznica` | Klasifikacija plodišta truležnica prema brojnosti. |
| `ostali_nametnici` | Ostali nametnici koji mogu utjecati na zdravlje stabala. |
| `vitalitet` | Klasifikacija vitaliteta stabala. |
| `traq` | Klasifikacija rizika stabala prema TRAQ metodi. |
| `bonitet` | Klasifikacija boniteta stabala. |
| `katastri` | Evidencija različitih katastara stabala. |
| `stabla` | Glavna tablica za evidenciju pojedinačnih stabala. |
| `stabla_fotografije` | Fotografije pojedinačnih stabala. |
| `stabla_mjere` | Mjere pojedinačnih stabala (visina, širina krošnje, starost itd.). |
| `stabla_pridanak` | Podaci o pridanku stabla (trulež, ozljede, nametnici itd.). |
| `stabla_deblo` | Podaci o deblu stabla (nagnutost, ozljede, nametnici itd.). |
| `krosnja_oblici` | Oblici krošnji stabala. |
| `stabla_krosnja` | Podaci o krošnji stabla (oblik, gustoća, ozljede itd.). |
| `stabla_opce_stanje` | Opće stanje stabla (vitalitet, TRAQ, bonitet itd.). |
| `stabla_preporuka` | Preporuke za održavanje stabala (orezivanje, rušenje itd.). |

---

## 🚀 Instalacija i korištenje

Za kreiranje baze podataka i tablica, pokrenite priloženi SQL skript u PostgreSQL bazi s instaliranim PostGIS ekstenzijama.

```bash
psql -U korisnik -d postgres -f zeleni_katastar.sql
```

---

## 📖 Zaključak

Ova dokumentacija pruža preglednu strukturu baze podataka **Zeleni Katastar**, omogućavajući jednostavno korištenje i održavanje podataka o stablima i njihovom stanju. 

---

## 📑 Detaljni opis tablica

### 🌲 Drvenaste vrste (`drvenaste_vrste`)
- `id`: Identifikator vrste (primarni ključ)
- `znanstveni_naziv`: Znanstveni naziv vrste (jedinstven)
- `hrvatski_naziv`: Hrvatski naziv vrste

### 🍄 Trulež (`trulez`)
- `id`: Identifikator stupnja truleži
- `naziv`: Naziv stupnja truleži (Mala, Srednja, Jaka)

### 🛠️ Mehaničke ozljede (`mehanicke_ozljede`)
- `id`: Identifikator ozljede
- `naziv`: Naziv ozljede (Svježe, Stare, Dobro kalusiraju, Loše kalusiraju)

### 🔬 Hipertrofije (`hipertrofije`)
- `id`: Identifikator hipertrofije
- `naziv`: Naziv hipertrofije (Benigne, Maligne)

### 🍄 Gljive (`gljive`)
- `id`: Identifikator gljive
- `naziv`: Naziv gljive

### 🐞 Kukci (`kukci`)
- `id`: Identifikator kukca
- `naziv`: Naziv kukca

### 🍂 Plodišta truležnica (`plodista_truleznica`)
- `id`: Identifikator plodišta
- `naziv`: Naziv plodišta (Malobrojna, Brojna, Vrlo brojna)

### 🦠 Ostali nametnici (`ostali_nametnici`)
- `id`: Identifikator nametnika
- `naziv`: Naziv nametnika

### 🌱 Vitalitet (`vitalitet`)
- `id`: Identifikator vitaliteta
- `naziv`: Naziv vitaliteta (Vrlo dobar, Dobar, Srednji, itd.)

### ⚠️ TRAQ (`traq`)
- `id`: Identifikator TRAQ rizika
- `naziv`: Naziv rizika (Malen, Umjeren, Visok, Ekstreman)

### 📊 Bonitet (`bonitet`)
- `id`: Identifikator boniteta
- `naziv`: Naziv boniteta (I, II, III, IV, V)

---

## 📌 Glavne tablice za evidenciju stabala

### 📍 Katastri (`katastri`)
- `id`: Identifikator katastra
- `naziv`: Naziv katastra
- `opis`: Opis katastra
- `datum`: Datum kreiranja katastra

### 🌳 Stabla (`stabla`)
- `id`: UUID stabla
- `katastar_id`: Referenca na katastar
- `datum_mjerenja`: Datum mjerenja stabla
- `drvenasta_vrsta_id`: Referenca na vrstu stabla
- `geom`: Geometrijska lokacija stabla (Point, EPSG:3765)

### 📷 Fotografije stabala (`stabla_fotografije`)
- `id`: UUID fotografije
- `stablo_id`: Referenca na stablo
- `fotourl`: URL fotografije

### 📐 Mjere stabala (`stabla_mjere`)
- Visina, širina krošnje, starost, napomena itd.

### 🌱 Pridanak stabla (`stabla_pridanak`)
- Podaci o pridanku stabla (trulež, ozljede, nametnici itd.)

### 🌲 Deblo stabla (`stabla_deblo`)
- Podaci o deblu stabla (nagnutost, ozljede, nametnici itd.)

### 🍃 Krošnja stabla (`stabla_krosnja`)
- Oblik krošnje, gustoća, ozljede, nametnici itd.

### 📈 Opće stanje stabla (`stabla_opce_stanje`)
- Vitalitet, TRAQ prije i nakon, bonitet, statika itd.

### 🛠️ Preporuke za održavanje (`stabla_preporuka`)
- Hitnost, orezivanje, sanacija, rušenje, zamjena itd. 