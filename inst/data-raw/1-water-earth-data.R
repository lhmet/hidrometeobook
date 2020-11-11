
# DT com dados da tabela de Bonan 2015,
water_earth <- data.frame(
  pool = c("Oceano", "Água doce", "Áreas congeladas", "Água subterrânea", "Lagos, Rios e áreas úmidas", "Água no solo", "Atmosfera"),
  vol = c(1335040000, 41984700, 26372000, 15300000, 178000, 122000, 12700)
)
# total de água na hidrosfera
tot <- sum(water_earth$vol[1:2])
# água relativa
water_earth <- dplyr::mutate(water_earth,
  water_rel = round(vol / tot * 100, 3)
)
# arrendonda valores
water_earth$water_rel[1:2] <- round(water_earth$water_rel[1:2])
water_earth$water_rel[3:4] <- round(water_earth$water_rel[3:4], 1)
# total de água doce na hidrosfera
tot_freswater <- water_earth$vol[2]
water_earth$freshwater_rel <- NA
water_earth$freshwater_rel[-c(1, 2)] <- water_earth$vol[-c(1, 2)] / tot_freswater * 100
water_earth$freshwater_rel[3:4] <- round(water_earth$freshwater_rel[3:4], 1)
water_earth$freshwater_rel[5:7] <- round(water_earth$freshwater_rel[5:7], 2)
# water_earth <- transform(water_earth,
#                          freshwater_rel = ifelse(is.na(freshwater_rel), "-", freshwater_rel))
# substituindo nomes
names(water_earth) <- c(
  "Reservatório",
  "Volume (Km^3^)",
  "Total de água (%)",
  "Total de água doce (%)"
)
# imprimindo tabela
usethis::use_data(water_earth, overwrite = TRUE)







