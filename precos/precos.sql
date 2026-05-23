-- analytics.precos
-- Painel mensal de índices de preços ao consumidor.
-- Uma coluna por série, indexado por data (mês de referência).
--
-- Séries:
--   433   IPCA - Variação mensal (%)
--   13522 IPCA - Variação acumulada em 12 meses (%)
--   188   INPC - Variação mensal (%)
--   189   IGP-M - Variação mensal (%)
--   7478  IPCA-15 - Variação mensal (%)

SELECT
    sd.date,
    MAX(CASE WHEN sd.series_id = 433   THEN sd.value END) AS ipca_mensal,
    MAX(CASE WHEN sd.series_id = 13522 THEN sd.value END) AS ipca_acum_12m,
    MAX(CASE WHEN sd.series_id = 188   THEN sd.value END) AS inpc_mensal,
    MAX(CASE WHEN sd.series_id = 189   THEN sd.value END) AS igpm_mensal,
    MAX(CASE WHEN sd.series_id = 7478  THEN sd.value END) AS ipca15_mensal
FROM series_data sd
WHERE sd.series_id IN (433, 13522, 188, 189, 7478)
  AND sd.ativo = TRUE
GROUP BY sd.date
ORDER BY sd.date;
