-- analytics.cambio
-- Painel diário de taxas de câmbio livre (venda).
-- Uma coluna por série, indexado por data.
--
-- Séries:
--   1     Taxa de câmbio - Livre - Dólar americano (venda) - R$/US$
--   21619 Taxa de câmbio - Livre - Euro (venda) - R$/EUR

SELECT
    sd.date,
    MAX(CASE WHEN sd.series_id = 1     THEN sd.value END) AS usd_brl,
    MAX(CASE WHEN sd.series_id = 21619 THEN sd.value END) AS eur_brl
FROM series_data sd
WHERE sd.series_id IN (1, 21619)
  AND sd.ativo = TRUE
GROUP BY sd.date
ORDER BY sd.date;
