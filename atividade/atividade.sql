-- analytics.atividade
-- Painel mensal de indicadores de atividade econômica.
-- Uma coluna por série, indexado por data (mês de referência).
--
-- Séries:
--   24363 IBC-Br - Índice de Atividade Econômica do Banco Central
--         (dessazonalizado, base 2002=100)

SELECT
    sd.date,
    MAX(CASE WHEN sd.series_id = 24363 THEN sd.value END) AS ibc_br
FROM series_data sd
WHERE sd.series_id IN (24363)
  AND sd.ativo = TRUE
GROUP BY sd.date
ORDER BY sd.date;
