myGroup_mrip <- function (myDF)
{
  
  df_out <- myDF %>%
    filter(st_f=="FLORIDA") %>%
    select(c(year,wave_f,tot_cat)) %>% 
    mutate(year=as.character(year)) %>% 
    group_by(year,wave_f) %>%
    summarize(catch_count = sum(tot_cat), .groups = 'drop')
  
  return(df_out)
    
}

myImport_mrip <- function ()
{
  
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_1981_1989.csv")
  mrip_out <- myGroup_mrip(mrip_in)
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_1990_1999.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_2000_2009.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_2010_2016.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_2017.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_2018.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_2019.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  mrip_in <- read_csv("data/mrip/mrip_catch_wave_2020.csv")
  mrip_out <- rbind(mrip_out,myGroup_mrip(mrip_in))
  
  
  return(mrip_out )
}


myGroup_hab <- function (myDF)
{
df_out <- myDF %>%
  mutate(date=as.Date(SAMPLE_DATE)) %>%
  mutate(month=format(date, "%m")
         ,year=format(date,"%Y")) %>%
  #filter(year == "2020") %>%
  mutate(wave=case_when(
                        month=="01" ~ "JAN/FEB",
                        month=="02" ~ "JAN/FEB",
                        month=="03" ~ "MAR/APR",
                        month=="04" ~ "MAR/APR",
                        month=="05" ~ "MAY/JUN",
                        month=="06" ~ "MAY/JUN",
                        month=="07" ~ "JUL/AUG",
                        month=="08" ~ "JUL/AUG",
                        month=="09" ~ "SEP/OCT",
                        month=="10" ~ "SEP/OCT",
                        month=="11" ~ "NOV/DEC",
                        month=="12" ~ "NOV/DEC",
  )) %>%
  mutate(wave_sort=as.integer(case_when(
                        month=="01" ~ "1",
                        month=="02" ~ "1",
                        month=="03" ~ "2",
                        month=="04" ~ "2",
                        month=="05" ~ "3",
                        month=="06" ~ "3",
                        month=="07" ~ "4",
                        month=="08" ~ "4",
                        month=="09" ~ "5",
                        month=="10" ~ "5",
                        month=="11" ~ "6",
                        month=="12" ~ "6",
  ))) %>%
  
  select(c(year,wave,wave_sort,COUNT_)) %>% 
  group_by(year,wave,wave_sort) %>%
  summarize(brevis_count = sum(COUNT_),.groups = "drop")

}

myImport_hab <- function ()
{
  hab_in <- read_csv("data/hab/Historic_Harmful_Algal_Bloom_Events_1980_-_1989.csv")
  hab_out <- myGroup_hab(hab_in)
  hab_in <- read_csv("data/hab/Historic_Harmful_Algal_Bloom_Events_1990_-_1999.csv")
  hab_out <- rbind(hab_out,myGroup_hab(hab_in))
  hab_in <- read_csv("data/hab/Historic_Harmful_Algal_Bloom_Events_2000_-_2006.csv")
  hab_out <- rbind(hab_out,myGroup_hab(hab_in))
  hab_in <- read_csv("data/hab/Historic_Harmful_Algal_Bloom_Events_2007_-_2014.csv")
  hab_out <- rbind(hab_out,myGroup_hab(hab_in))
  hab_in <- read_csv("data/hab/Recent_Harmful_Algal_Bloom_(HAB)_Events.csv")
  hab_out <- rbind(hab_out,myGroup_hab(hab_in))
  
  return(hab_out)
}