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
| `precos` | IPCA 433, IPCA acum 12m 13522, INPC 188, IGP-M 189, IPCA-15 7478 | `analytics.precos` | Mensal |
| `juros` | SELIC meta 432, SELIC over 11, CDI 12, TR 226 | `analytics.juros` | Diária / mensal |
| `cambio` | USD/BRL 1, EUR/BRL 21619 | `analytics.cambio` | Diária |
| `atividade` | IBC-Br 24363 | `analytics.atividade` | Mensal |
| `credito` | Saldo crédito 20539, inadimplência 21082, spread 20783 | `analytics.credito` | Mensal |
| `monetario` | M1 27790, M2 27791, M3 27792, M4 27793 | `analytics.monetario` | Mensal |

## Detalhes dos pipelines

### `precos` — Índices de preços

Painel mensal de índices de preços ao consumidor e ao produtor.

| Coluna | Série SGS | Descrição |
|---|---|---|
| `ipca_mensal` | 433 | IPCA — variação mensal (%) |
| `ipca_acum_12m` | 13522 | IPCA — variação acumulada em 12 meses (%) |
| `inpc_mensal` | 188 | INPC — variação mensal (%) |
| `igpm_mensal` | 189 | IGP-M — variação mensal (%) |
| `ipca15_mensal` | 7478 | IPCA-15 — variação mensal (%) |

### `juros` — Taxas de juros

Painel de taxas de juros de referência da economia brasileira.

| Coluna | Série SGS | Descrição |
|---|---|---|
| `selic_meta_aa` | 432 | Meta para a Taxa Selic — % a.a. (decisão Copom) |
| `selic_over_am` | 11 | Selic acumulada no mês — % a.m. |
| `cdi_am` | 12 | CDI acumulada no mês — % a.m. |
| `tr` | 226 | Taxa Referencial (TR) — % |

### `cambio` — Taxas de câmbio

Painel diário de taxas de câmbio livre (cotação de venda).

| Coluna | Série SGS | Descrição |
|---|---|---|
| `usd_brl` | 1 | Taxa de câmbio USD/BRL — R$/US$ |
| `eur_brl` | 21619 | Taxa de câmbio EUR/BRL — R$/EUR |

### `atividade` — Atividade econômica

Painel mensal do indicador antecipado de atividade econômica do BCB.

| Coluna | Série SGS | Descrição |
|---|---|---|
| `ibc_br` | 24363 | IBC-Br dessazonalizado — base 2002=100 |

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
├── juros/
│   ├── fetch.toml
│   ├── transform.toml
│   └── juros.sql
├── cambio/
│   ├── fetch.toml
│   ├── transform.toml
│   └── cambio.sql
├── atividade/
│   ├── fetch.toml
│   ├── transform.toml
│   └── atividade.sql
├── credito/
│   ├── fetch.toml
│   ├── transform.toml
│   └── credito.sql
└── monetario/
    ├── fetch.toml
    ├── transform.toml
    └── monetario.sql
```

## Licença

MIT — veja [LICENSE](LICENSE).
