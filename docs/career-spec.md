# Road to Apex GP — Career Mode Spec

A full career where you start in rental karts and work your way up, licence by licence and car by car, to a seat in the Apex GP World Championship (F1). Inspired by the *structure* of Gran Turismo 4's career (licence tests that gate event tiers, prize money, a garage of cars you buy and upgrade); everything here — names, tiers, events, cars — is original to Apex Grand Prix.

---

## 1. The core loop

1. **Earn a licence** → passes unlock a new tier of events.
2. **Enter events** in your tier (single races, cups, championships, specials) with a car from your garage that meets the event rules.
3. **Win prize money** (and sometimes prize cars / parts).
4. **Spend it** on new cars, upgrades and repairs.
5. **Build reputation** → better entries, sponsor deals and, at the top, team contracts.
6. Repeat until you're racing — and winning — in Apex GP.

The player always has something to aim for: the next licence, the next car, or the next title.

---

## 2. The ladder (5 tiers)

| Tier | Name | Vehicle class (existing in game) | Tracks | Unlocked by |
|---|---|---|---|---|
| 1 | **Kart Club** | Go-Kart 4-stroke (`kart4`), then 2-stroke (`kart`) | Valle Verde, Rocca, Westfield | Start of career |
| 2 | **Street Turbo Series** | Street Car turbo coupe (`street`) | Nordhavn, Lakeside, Costa, Harbour Viaduct | **National B licence** |
| 3 | **Touring Championship** | Touring V8 race car (`touring`) | All GP tracks incl. Granite Pass, Mount Kestrel | **National A licence** |
| 4 | **Formula Junior** | Open-wheel car, restricted (F1 car at ~65% power, no DRS/ERS) | GP tracks + Metropolis | **International licence** |
| 5 | **Apex GP World Championship** | Full F1 (`f1`) with DRS + ERS | Full calendar incl. Big Mama | **Super licence** + a team contract |

Each tier has 6–10 events; you don't need to win them all to move on, but titles pay best and raise reputation fastest.

---

## 3. Licences

Five licences: **Kart → National B → National A → International → Super**. Each licence = **5 short tests** (30–90 s each), each graded **Bronze / Silver / Gold** against target times or scores. Pass all 5 at Bronze or better to earn the licence. Golds give credits and a small prize (e.g. a livery or part).

Example tests (all use existing physics, tracks and HUD):

| Licence | Tests |
|---|---|
| Kart | Launch & stop in a box · Hairpin exit speed · Clean lap of Rocca · Overtake 3 slower karts · Rain-free hot lap target |
| National B | Brake from 160 km/h to a cone line · Chicane slalom · Sector time at Lakeside · Defend position for one lap · Full lap time |
| National A | Heavy-car braking zones · Mount Kestrel downhill sector · Damage-free lap · Pit stop under the limiter · Wet-track lap |
| International | Downforce corner speed (Costa sweepers) · Tunnel sector at Granite Pass · Use slipstream to pass · Tyre-wear stint · Metropolis lap |
| Super | DRS/ERS deployment test · Qualifying lap target · Safety-car restart · 5-lap race finish in top 3 · Big Mama hot lap |

Failing is fine — retry instantly. Tests reuse the time-trial mode with a scripted start position, a target, and a pass/fail check (lap time, speed at a point, damage = 0, position, etc.).

---

## 4. Money (credits)

| Earn | Typical |
|---|---|
| Race prize (by finishing position) | Tier 1: 500–2,500 cr · Tier 5: 50,000–250,000 cr |
| Championship bonus | 3× a race win |
| Licence golds | 1,000–20,000 cr |
| Sponsor bonuses (see §8) | per-race targets, e.g. "finish top 5" |

| Spend | Notes |
|---|---|
| **Cars** | Each tier's car must be bought (or won). Tier 1 rental kart is free. |
| **Upgrades** | Engine stages, tyres, weight, aero, gearing — see §5 |
| **Repairs** | After damage: cost scales with damage % (ties into the new damage system) |
| **Entry fees** | Small, higher tiers only (keeps the economy moving) |

Rule of thumb: winning a tier's main championship should roughly pay for the next tier's starter car.

---

## 5. Garage, cars and upgrades

- **Garage**: every car you own, with its **Performance Rating (PR)** — one number from power, weight, grip and aero (like a performance index). Events can cap PR so you can't over-upgrade.
- **Buying**: a showroom per tier (karts, street coupes, touring sedans in all six body styles, Formula Junior, Apex GP). Body styles are cosmetic within a class.
- **Upgrades** (map directly onto existing car parameters — `powerMul`, `gripMul`, `aeroMul`, mass, gear ratios):

| Upgrade | Stages | Effect |
|---|---|---|
| Engine | 1–3 | +5 / +10 / +16% power |
| Tyres | Sport / Racing / Soft slick | grip ×1.03 / 1.06 / 1.09 (more wear) |
| Weight reduction | 1–3 | −3 / −6 / −10% mass |
| Aero kit | 1–2 (touring/street) | more downforce, a bit more drag |
| Gearbox | Close-ratio | shorter gears, faster acceleration |
| Brakes | Racing | +12% braking force |

- **Liveries**: pick team colours / a number; prize liveries for golds and titles.

---

## 6. Events per tier

Each tier offers a mix:

| Type | Format |
|---|---|
| **Single race** | 3–5 laps, quick money |
| **Cup** | 3 rounds, points, trophy |
| **Championship** | 5–6 rounds, the tier's main title (uses the existing `SERIES` system) |
| **Specials** | e.g. *Metropolis Night Race*, *Big Mama 10-lap endurance with a mandatory pit stop*, *Wet Weather Cup at Nordhavn*, *Mountain 1000* at Mount Kestrel |
| **One-make** | everyone in identical cars — pure driving |

Events show: class / PR limit, laps, weather, prize table, reward car (if any).

---

## 7. AI and difficulty

- AI skill scales with tier (Tier 1 friendly → Tier 5 near-max), plus the existing difficulty slider as a global modifier.
- AI cars are matched to the event's PR so upgrades matter but can't trivialise a race.
- The existing AI personalities carry through the whole career, so you meet the same rival drivers as you climb.

---

## 8. Reputation, sponsors and contracts

- **Reputation (0–100)**: goes up with wins, titles, clean races and licence golds; down with heavy crashes.
- **Sponsors** (from Tier 2): offer per-race targets ("finish ahead of #12", "no damage") for bonus credits and a livery.
- **Team contracts** (Tier 4–5): top Formula Junior results bring offers from Apex GP teams (existing teams/tiers in the game). Better teams = faster cars but higher expectations. A Super licence + a contract are needed to enter Tier 5.
- **Apex GP seasons**: race full seasons; win the title to "finish" the career — with an endless "defend your title" mode afterwards.

---

## 9. Screens

1. **Career hub** — a simple map of five venues (Kart Park → Club Circuit → Touring HQ → Formula Centre → Apex GP), credits, reputation, current licence.
2. **Licence Centre** — tests with best grade per test.
3. **Events** — list per tier with requirements and prizes.
4. **Garage** — owned cars, PR, upgrades, repairs, livery.
5. **Showroom** — buy cars per tier.
6. **Results** — prize money breakdown, reputation change, unlock pop-ups.
7. **Trophy cabinet** — cups, titles, golds.

---

## 10. Save data (localStorage, one JSON object)

```json
{
  "version": 1,
  "credits": 12500,
  "reputation": 34,
  "licences": { "kart": "gold", "natB": "silver", "natA": null, "intl": null, "super": null },
  "tests": { "kart_1": "gold", "kart_2": "silver", "natB_3": "bronze" },
  "garage": [ { "id": "car_001", "cls": "kart", "body": 0, "upgrades": { "engine": 2, "tyres": "racing", "weight": 1 }, "damage": 0, "livery": { "c1": "#e10600", "c2": "#ffffff", "num": 7 } } ],
  "activeCar": "car_001",
  "events": { "t1_cup_valle": { "best": 1, "trophy": true } },
  "championships": { "t2_street_title": { "round": 3, "points": 61 } },
  "contract": null,
  "stats": { "races": 18, "wins": 6, "podiums": 11 }
}
```

The existing career save (`apexgp_career_v1`) stays for the current quick "pick a championship" mode; Road to Apex GP uses its own key so nothing breaks.

---

## 11. How it maps onto what already exists

| Needed | Already in the game |
|---|---|
| Classes per tier | `kart4`, `kart`, `street`, `touring`, `f1` |
| Formula Junior | the `f1` class with a power/aero multiplier and DRS/ERS off |
| Championships | the `SERIES` system + points tables + standings UI |
| Upgrades | per-car `powerMul`, `gripMul`, `aeroMul`, mass, gear ratios |
| Repairs | the damage system (`dmg` 0–1) → repair cost |
| Licence tests | time-trial mode + scripted start (`place(s,off)`) + checks |
| Rivals | driver personalities seeded by name |
| Tracks | 8 GP tracks + 3 kart tracks |

---

## 12. Build phases

1. **MVP**: career hub, credits, Tier 1–2 events, Kart + National B licences, buying the street car, prize money. *(Playable start-to-Tier-2.)*
2. **Garage & upgrades**: PR, upgrades, repairs, liveries, showroom for all classes.
3. **Tiers 3–4**: National A and International licences, touring and Formula Junior events, specials.
4. **Tier 5**: Super licence, sponsors, team contracts, full Apex GP seasons, trophy cabinet, "defend your title".
5. **Polish**: results animations, unlock pop-ups, balancing the economy.

---

## 13. Questions to decide

1. Should Formula Junior be its own lighter-looking car model, or the F1 car with a restrictor (cheaper to build)?
2. Licence tests: 5 per licence, or fewer and shorter?
3. Can the player skip back down tiers for money once they've moved up (GT-style grinding), or are lower tiers locked/less paying?
4. Should damage repair costs be on by default, or optional for a relaxed career?
5. One shared garage across all tiers, or separate per tier?
