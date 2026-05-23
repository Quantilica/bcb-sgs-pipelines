-- analytics.juros
-- Painel de taxas de juros de referência.
-- Uma coluna por série, indexado por data.
--
-- Séries:
--   432  Meta para a Taxa Selic (% a.a.) — mensal/decisão Copom
--   11   Selic acumulada no mês (% a.m.) — diária
--   12   CDI acumulada no mês (% a.m.)   — diária
--   226  Taxa Referencial - TR (%)        — diária

SELECT
    sd.date,
    MAX(CASE WHEN sd.series_id = 432 THEN sd.value END) AS selic_meta_aa,
    MAX(CASE WHEN sd.series_id = 11  THEN sd.value END) AS selic_over_am,
    MAX(CASE WHEN sd.series_id = 12  THEN sd.value END) AS cdi_am,
    MAX(CASE WHEN sd.series_id = 226 THEN sd.value END) AS tr
FROM series_data sd
WHERE sd.series_id IN (432, 11, 12, 226)
  AND sd.ativo = TRUE
GROUP BY sd.date
ORDER BY sd.date;
