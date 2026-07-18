# bcb-sgs-pipelines

Catálogo de pipelines ETL de referência para o motor
[`bcb-sgs-sql`](https://github.com/Quantilica/bcb-sgs-sql), cobrindo os
principais indicadores macroeconômicos do Banco Central do Brasil (BCB SGS).

## Instalação

```bash
bcb-sgs-sql plugin install https://github.com/Quantilica/bcb-sgs-pipelines.git --alias std
```

## Uso

```bash
# Listar todos os pipelines disponíveis
bcb-sgs-sql plugin list

# Executar um pipeline específico
bcb-sgs-sql run std precos
bcb-sgs-sql run std juros
bcb-sgs-sql run std cambio
bcb-sgs-sql run std atividade
bcb-sgs-sql run std credito
bcb-sgs-sql run std monetario
```

## Pipelines

| Pipeline | Séries BCB SGS | Saída analítica | Frequência |
|---|---|---|---|
| `precos` | Índices de preços ao consumidor (Tema) | `analytics.precos` | Mensal |
| `juros` | Taxas de juros (Tema) | `analytics.juros` | Diária / mensal |
| `cambio` | USD, EUR, JPY, GBP, CHF, DKK, NOK, SEK, AUD, CAD (Compra/Venda) | `analytics.cambio` | Diária |
| `atividade` | IBC-Br nacional e de 18 estados/regiões | `analytics.atividade` | Mensal |
| `credito` | Saldo crédito 20539, inadimplência 21082, spread 20783 | `analytics.credito` | Mensal |
| `monetario` | M1 27790, M2 27791, M3 27792, M4 27793 | `analytics.monetario` | Mensal |
| `alcool_carburante` | Hidratado 1399, Anidro 1400, Total 1401 | `analytics.alcool_carburante` | Mensal |
| `commodities` | IC-Br Agro 27574, Energia 27575, Metal 27577, Total 27576 | `analytics.commodities` | Mensal |
| `derivados_petroleo` | Produção (1389-92), Consumo (1393-98) | `analytics.derivados_petroleo` | Mensal |
| `desembolsos_bndes` | Total 7415, Setoriais 7416-19 | `analytics.desembolsos_bndes` | Mensal |
| `energia_eletrica` | Comercial 1402, Residencial 1403, Industrial 1404, Outros 1405, Total 1406 | `analytics.energia_eletrica` | Mensal |
| `movimento_cambio_contratado` | Tema "Movimento de câmbio contratado" | `analytics.movimento_cambio_contratado` | Diária |
| `pib_mensal` | Nominal BRL 4380, USD 4385 | `analytics.pib_mensal` | Mensal |

## Detalhes dos pipelines

### `precos` — Índices de preços

Séries de índices de preços ao consumidor filtradas por tema.

- `analytics.precos` (Long): colunas `date`, `series_id`, `valor`.

### `juros` — Taxas de juros

Séries de taxas de juros do mercado financeiro filtradas por tema.

- `analytics.juros` (Long): colunas `date`, `series_id`, `valor`.

### `cambio` — Taxas de câmbio

Taxas diárias de compra e venda de 10 moedas estrangeiras principais.

- `analytics.cambio` (Long): colunas `date`, `moeda`, `unidade`, `taxa_compra`, `taxa_venda`.

### `atividade` — Atividade econômica

Índices de atividade econômica (IBC-Br) nacional e de 18 estados/regiões, com ajuste e sem ajuste sazonal.

- `analytics.atividade` (Long): colunas `date`, `localidade_id`, `nivel_territorial`, `unidade_territorial`, `tipo_indice`, `valor`.



### `credito` — Operações de crédito

Painel mensal das condições de crédito do sistema financeiro.

| Coluna | Série SGS | Descrição |
|---|---|---|
| `credito_saldo_mi` | 20539 | Crédito total — saldo (R$ milhões) |
| `inadimplencia_pct` | 21082 | Inadimplência total — % da carteira |
| `spread_pp` | 20783 | Spread médio total (p.p.) |

### `monetario` — Agregados monetários

Painel mensal dos agregados monetários amplos (M1–M4).

| Coluna | Série SGS | Descrição |
|---|---|---|
| `m1_mi` | 27790 | M1 — saldo (R$ milhões) |
| `m2_mi` | 27791 | M2 — saldo (R$ milhões) |
| `m3_mi` | 27792 | M3 — saldo (R$ milhões) |
| `m4_mi` | 27793 | M4 — saldo (R$ milhões) |

## Validação

Para validar o catálogo localmente (requer `bcb-sgs-sql` instalado):

```bash
bcb-sgs-sql plugin validate --plugin-dir .
```

## Atualização

```bash
bcb-sgs-sql plugin update --alias std
```

## Estrutura do repositório

Cada pipeline é um diretório com o mesmo trio de arquivos
(`fetch.toml` + `transform.toml` + `<id>.sql`):

```
bcb-sgs-pipelines/
├── manifest.toml         # registro de todos os pipelines
├── README.md
├── LICENSE               # MIT
├── .gitignore
├── precos/
│   ├── fetch.toml
│   ├── transform.toml
│   └── precos.sql
├── juros/                         (fetch.toml + transform.toml + juros.sql)
├── cambio/                        (…)
├── atividade/                     (…)
├── credito/                       (…)
├── monetario/                     (…)
├── alcool_carburante/            (…)
├── commodities/                   (…)
├── derivados_petroleo/            (…)
├── desembolsos_bndes/             (…)
├── energia_eletrica/              (…)
├── movimento_cambio_contratado/   (…)
└── pib_mensal/                    (…)
```

São **13 pipelines** no total (ver `manifest.toml`).

## Licença

MIT — veja [LICENSE](LICENSE).
