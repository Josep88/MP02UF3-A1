#!/usr/bin/env sysbench

-- Modifying the commmand line parameters.
sysbench.cmdline.options = {
   mysql_user = {"mysql user", "root"},
   mysql_password = {"SB password", "patata"},
   mysql_socket = {"SB socket", "/var/lib/mysql/mysql.sock"},
   mysql_db = {"SB db", "db_hotels"},
}

-- Function to get a mysql connection
function get_conn()
  drv = sysbench.sql.driver()
  return drv:connect()
end

-- This function is called every time that we need to initialize a thread.
function thread_init()
  -- Every time that we initialize a thread we want to get a new
  -- mysql connection to use it.
  con = get_conn()
end

-- Event function
function event( thread_id )
  math.randomseed(thread_id)
  -- print( math.randomseed(thread_id) )
  vSELECT = "SELECT * "

  rndFROM = math.random(0,1)
  if rndFROM == 0 then
    vFROM = "FROM habitacions h "
  elseif rndFROM == 1 then
    vFROM = "FROM reserves r "
  end

  rndJOIN = math.random(0,1)
  if (rndJOIN == 0) and (rndFROM == 0) then
    vJOIN = "INNER JOIN hotels ho ON ho.hotel_id = h.hotel_id "
  elseif (rndJOIN == 1) and (rndFROM == 1) then
    vJOIN = "INNER JOIN clients c ON c.client_id = r.client_id "
  elseif (rndJOIN == 0) and (rndFROM == 1) then
    vJOIN = "INNER JOIN habitacions h ON h.hab_id = r.hab_id "
  else
    vJOIN = ""
  end
  
  rndWHERE = math.random(0,1)
  rndWHERE2 = math.random(0,1)
  vWHERE2 = ""
  if (rndWHERE == 0) and (rndJOIN == 0) and (rndFROM == 0) then
    -- from habitacions innerjoin hotels
    vWHERE = "WHERE NOT(h.hotel_id MOD 2) "
        if rndWHERE2 == 0 then
          vWHERE2 = "AND ho.categoria = 5 "
        end
  elseif (rndWHERE == 0) and (rndJOIN == 1) and (rndFROM == 1) then
    -- from reserves innerjoin clients
    vWHERE = "WHERE (r.data_inici <= '2014-12-31' AND r.data_fi >= '2014-01-01') "
        if rndWHERE2 == 0 then
          vWHERE2 = "AND (YEAR(CURDATE())-YEAR(c.data_naix)) >= 25 "
        end
  elseif (rndWHERE == 0) and (rndJOIN == 0) and (rndFROM == 1) then
    -- from reserves innerjoin habitacions
    vWHERE = "WHERE (YEAR(r.data_inici) = '2015' AND MONTH(r.data_fi) = '10') "
    if rndWHERE2 == 0 then
          vWHERE2 = "AND h.hotel_id > 200 "
        end
  else
    vWHERE = ""
  end

 con:query(vSELECT .. vFROM .. vJOIN .. vWHERE .. vWHERE2 .. ";")
  -- print(vSELECT .. vFROM .. vJOIN .. vWHERE .. vWHERE2 .. ";")
  -- print(rndFROM .. rndJOIN .. rndWHERE .. rndWHERE2)
  
  if rndFROM == 0 then
    -- 7 i 8
	con:query("SELECT (SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 1) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 1) OR (data_inici <= '2015-1-01' AND data_fi >= '2015-1-31')) ) gener," .. 
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 2) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 2) OR (data_inici <= '2015-2-01' AND data_fi >= '2015-2-31')) ) febrer," ..
            "(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 3) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 3) OR (data_inici <= '2015-3-01' AND data_fi >= '2015-3-31')) ) marc," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 4) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 4) OR (data_inici <= '2015-4-01' AND data_fi >= '2015-4-31')) ) abril," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 5) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 5) OR (data_inici <= '2015-5-01' AND data_fi >= '2015-5-31')) ) maig," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 6) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 6) OR (data_inici <= '2015-6-01' AND data_fi >= '2015-6-31')) ) juny," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 7) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 7)         OR (data_inici <= '2015-7-01' AND data_fi >= '2015-7-31')) ) juliol," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 8) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 8) OR (data_inici <= '2015-8-01' AND data_fi >= '2015-8-31')) ) agost," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 9) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 9) OR (data_inici <= '2015-9-01' AND data_fi >= '2015-9-31')) ) septembre," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 10) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 10) OR (data_inici <= '2015-10-01' AND data_fi >= '2015-10-31')) ) octubre," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 11) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 11) OR (data_inici <= '2015-11-01' AND data_fi >= '2015-11-31')) ) novembre," ..
			"(SELECT count(*) FROM reserves WHERE ((YEAR(data_inici) = 2015 AND MONTH(data_inici) = 12) OR (YEAR(data_fi) = 2015 AND MONTH(data_fi) = 12) OR (data_inici <= '2015-12-01' AND data_fi >= '2015-12-31')) ) decembre;")
	con:query("SELECT DISTINCT ho.nom FROM hotels ho INNER JOIN habitacions ha ON ho.hotel_id = ha.hotel_id WHERE ha.hab_id NOT IN (SELECT r2.hab_id FROM reserves r2 WHERE (r2.data_inici <= '2015-05-17' AND r2.data_fi >= '2015-05-01'));")
  elseif rndFROM == 1 then
    -- 13, 20 i 21
    con:query("SELECT COUNT(r.reserva_id),p.nom FROM reserves r INNER JOIN clients c ON c.client_id = r.client_id INNER JOIN paisos p ON p.pais_id = c.pais_origen_id WHERE (r.data_inici <= '2016-12-31' AND r.data_fi >= '2016-01-01') GROUP BY p.nom ORDER BY COUNT(r.reserva_id) DESC LIMIT 5;")
	con:query("SELECT COUNT(r.reserva_id),ho.nom FROM reserves r INNER JOIN habitacions ha ON ha.hab_id = r.hab_id INNER JOIN hotels ho ON ho.hotel_id = ha.hotel_id WHERE (r.data_inici <= '2015-12-31' AND r.data_fi >= '2015-01-01') GROUP BY ho.nom HAVING COUNT(r.reserva_id) = (" ..
              "SELECT MAX(s.qt) FROM (" ..
              "SELECT COUNT(r2.reserva_id) as qt FROM reserves r2 INNER JOIN habitacions ha2 ON ha2.hab_id = r2.hab_id INNER JOIN hotels h2 ON h2.hotel_id = ha2.hotel_id WHERE (r2.data_inici <= '2015-12-31' AND r2.data_fi >= '2015-01-01') AND (h2.categoria = 4) GROUP BY h2.nom)s);")
	con:query("SELECT COUNT(r.reserva_id),ho.nom FROM reserves r INNER JOIN habitacions ha ON ha.hab_id = r.hab_id INNER JOIN hotels ho ON ho.hotel_id = ha.hotel_id GROUP BY ho.nom HAVING COUNT(r.reserva_id) = (" ..
              "SELECT MAX(s.qt) FROM (" ..
              "SELECT COUNT(r2.reserva_id) as qt FROM reserves r2 INNER JOIN habitacions ha2 ON ha2.hab_id = r2.hab_id INNER JOIN hotels h2 ON h2.hotel_id = ha2.hotel_id GROUP BY h2.nom)s);")
  end
  
end
