-- LINEユーザーのテストレコード投入用スクリプト
INSERT INTO
	"1".members(service_id,members_no,name,name_kana,birth,gender,address,area_id,line_flg)
SELECT
	'1' as service_id,
--   members_noの自動生成(5100~5200)  
  5100 + (RANDOM()*100)::INTEGER AS members_no,
  '検診太郎LINE' || i as name,
  'ケンシンタロウライン' || i as name_kana,
  ('1960-07-01'::DATE + i*10::INTEGER)::DATE AS birth,
  '1' as gender,
  '米子市米原1' || i || '丁目' as address,
  '1' as area_id,
  true::BOOLEAN as line_flg
FROM
  GENERATE_SERIES(4, 4) as i
ORDER BY
	members_no
;