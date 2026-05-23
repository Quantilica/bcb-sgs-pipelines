-- analytics.monetario
-- Painel mensal de agregados monetários.
-- Uma coluna por série, indexado por data (mês de referência).
--
-- Séries:
--   27790 M1 - saldo (R$ milhões)
--   27791 M2 - saldo (R$ milhões)
--   27792 M3 - saldo (R$ milhões)
--   27793 M4 - saldo (R$ milhões)

SELECT
    sd.date,
    MAX(CASE WHEN sd.series_id = 27790 THEN sd.value END) AS m1_mi,
    MAX(CASE WHEN sd.series_id = 27791 THEN sd.value END) AS m2_mi,
    MAX(CASE WHEN sd.series_id = 27792 THEN sd.value END) AS m3_mi,
    MAX(CASE WHEN sd.series_id = 27793 THEN sd.value END) AS m4_mi
FROM series_data sd
WHERE sd.series_id IN (27790, 27791, 27792, 27793)
  AND sd.ativo = TRUE
GROUP BY sd.date
ORDER BY sd.date;
