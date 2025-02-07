# EV Charging Optimization at Portland State University

## Problem Overview:

Portland State University is an urban commuter university. With over
20,000 students enrolled, 61% from the Portland area, and over 5,000
employees, the university attracts thousands of individuals to its
campus on a daily basis (@PSUFacts and @PSUHeadcount). While multi-modal
transportation is encouraged, driving remains a popular enough option
for 15 buildings to offer parking, three of which are dedicated parking
structures \[@PSUBuildings\]. Within those parking options, there are a
total of 24 electronic vehicle (EV) charging stations available to PSU
commuters \[@PSUParking\].

In recent years, electric vehicles have seen a surge in popularity,
propelled primarily by greater operating affordability and decreased
emissions impact \[@zhou2021\]. Ownership is only expected to rise with
global estimates of 25% growth in new electric car sales year-over-year
\[@IEA\]. Within the state of Oregon alone, EV sales accounted for 16%
of all new vehicle sales within the first quarter of 2023, and the state
is striving to reach 250,000 EV registrations by 2025 \[@ODE2023\]. As
EV ownership increases, it becomes all the more critical to address
charging infrastructure, which is often cited as one of the most
pressing issues facing EV adoption \[@Ahmad2022\]. Bearing this in mind,
how does Portland State University’s charging infrastructure support
demand on campus and how should further development of EV charging
stations proceed?

### Literature Review:

In a review of fifty different optimization studies, Ahmad et al.
outline three main approaches taken when optimizing placement of EV
chargers: that of the distribution network operator (DNO), the EV user,
and the charging station owner (CSO) (2022). Each approach is unique in
its perspective, and as such, requires varying information for its
problem formulation. The DNO approach is generally technical and
expansive with considerations towards entire transportation networks and
grid power balance \[@Ahmad2022\]. The EV user approach is focused more
specifically on driver needs by minimizing travelling times, waiting
times, charging times, and all associated costs \[@Ahmad2022\]. Finally,
the CSO approach is focused on maximizing profits and return on
investments from EV charging by minimizing installation, operation, and
maintenance costs \[@Ahmad2022\]. Considering the available data and the
goals of PSU’s Transportation and Parking Services, this project takes a
CSO type approach, seeking to optimize build-out and investment from the
perspective of PSU.

From the CSO perspective, costs are generally the driving functions in
EV charger placement optimization. One-time costs typically included in
EV optimization models were building, construction, installation, and
equipment costs \[@Ahmad2022\]. Recurring costs included electricity
costs, equipment service costs, and maintenance \[@Ahmad2022\]. Within
these models, costs are constrained by limits on investments and
revenues from use-fees \[@Ahmad2022\]. Research also suggests station
owners may receive revenue by way of vehicle to grid storage in off-peak
times or through incentive-based demand response programs, although
these incentives are determined at a network level (@moradijoz2018 and
@Simorgh2018).

There are 3 types of EV chargers, each with varying electricity
requirements, charging speeds, and resulting usage patterns. The charger
types, in order of ascending charging speed, are as follows: Level 1,
Level 2, and Direct Current Fast Charging (DCFC) \[@USDoT\]. Level 1
chargers can charge a full electric vehicle from 0% to 80% in an average
of 40-50 hours, Level 2 chargers in 4-10 hours, and DCFC in just 20
minutes to an hour \[@USDoT\]. Level 1 chargers are the simplest and
most affordable type fo charging as they operate through standard 120V
outlets, such as those found in homes, and most EVs come with a Level 1
cord requiring no additional equipment \[@USDoE\]. Level 2 chargers
operate on 240V residential or 208V commercial services and require a
dedicated 40-Amp circuit, therefore may require additional
infrastructure changes to install \[@USDoE\]. DC Fast Chargers operate
at a much higher 400V to 1000V direct current with outputs ranging from
50 to 350kW, but many electric vehicles may not be able to handle
outputs greater than 150 kW (@USDoT and @HOWELL2017).

Although the quick charging time associated with DCFC is convenient,
research suggests this type of charging is typically reserved for long
distance trips, with Level 1 or Level 2 charging preferred for use at
home or work \[@LEE2020\]. In fact, 50-80% of charging has been found to
occur at home with another 15-20% occurring at work, and just 5%
occurring at public locations such as parking lots \[@LEE2020\]. As
such, it appears that Level 1 or 2 charging is much more important for a
location like Portland State University where dwell times are higher,
especially for faculty, but ultimately demand for charging may not be
all that high with patterns of charging at home in the forefront.

### Interview Insights:

An interview with representatives from PSU Transportation and Parking
Services provided anecdotal feedback that current charging
infrastructure at PSU seems to exceed current demand. Using upgraded
Blink and PlugsIO features, parking managers can track that only a
handful of individuals are consistent users, and furthermore, employee
survey results indicate that more than half of EV driving faculty do not
need to charge on campus. Conversely, the demand for standard parking is
very high with parking structures 1 and 2 consistently full throughout
the week. PSU is still planning on building out EV charging
capabilities, however the focus will be on Level 1 chargers due to lower
costs to build and maintain.

### Objectives:

The following objectives were developed for this project after a review
of the literature, the interview with PSU Transportation and Parking
Services, and the available data:

1.  Determine the demand for electric vehicle charging on campus through
    an analysis of the Blink charging data provided by PSU
    Transportation and Parking Services.

2.  Develop an optimized build-out plan for the relocation of current
    demand to parking structure 3 over the course of one term. As demand
    for standard parking in structures 1 and 2 is high, the team will
    focus on an optimized plan to meet existing demand in the
    underutilized parking structure 3.

### Methodology

At a high level, the project methodology included a literature review,
interview, data analysis, and finally model implementation using demand
and key trends from the data. Relevant EV optimization research was
reviewed during the literature review process for key project
considerations. Data and PSU specific insights were extracted from the
interview process and used to inform model direction.

## Data Analysis

### Data Background:

The data used in this project was collected via Blink during the months
of 08/31/2023 through 10/31/2023 across for 8 different EV chargers.
These chargers are located in a single parking structure and are used as
a representative sample of greater parking and EV parking trends on
campus.

### Summary:

The sample data provided to us by Transportation and Parking Service
provided 237 instances across a span of approximately 9 weeks (62 days).
In this sample, Saturday was the weekday with the most occurrences
across the data (50) and Sunday was the lowest occurrences (19). The
average plug duration was 4 hours 5 minutes and total energy duration
for those 8 chargers was 1138 hours (a total of 2637 kW’s). The median
occurrences on any given day was 4, the maximum occurrence on any given
day was Saturday (10) and lowest occurrences across Sunday, Monday,
Thursday, Tuesday and Friday (1).

### Demand:

From the data sample, a minimum conservative projection could be
estimated. Knowing that the sample data provided 8 chargers out of 24,
we could take the sample average (4) and multiply it by remaining
chargers not accounted for. Despite not understanding the demand of the
other chargers, the average projection multiplied by 3 (= 84 weekly
connections) estimates lower than a theoretical maximum given the
observed sample (141 weekly). Therefore at a minimum, the estimated
value might live within it’s normal distribution.

### Lots Available:

Given an estimated weekly demand, we could look at the percentages of
lots used given the demand and the actual data observed. This percentage
of demand calculated were used to estimate lots available.

### Data Processing:

    # Read in Blink data
    Blink <- Read("data/EV-blink.csv", quiet = TRUE)

    # Convert relevant columns to duration measurements
    Blink$Total.Time <- as.duration(hms(Blink$Total.Time))
    Blink$Occupancy.Billable.Time <- as.duration(hms(Blink$Occupancy.Billable.Time))
    Blink$Total.Occupancy.Time <- as.duration(hms(Blink$Total.Occupancy.Time))
    Blink$Billable.Time <- as.duration(hms(Blink$Billable.Time))
    Blink$Plug.Duration <- as.duration(hms(Blink$Plug.Duration))
    Blink$Energy.Duration <- as.duration(hms(Blink$Energy.Duration))

![](EV_Charging_Optimization_files/figure-markdown_strict/Box%20plots%20of%20key%20measurements-1.png)

    # Removing Outliers
    quartiles <- quantile(Blink$Total.Time.hrs, probs = c(0.25, 0.75),
        na.rm = FALSE)
    IQR <- IQR(c(Blink$Total.Time.hrs, Blink$Energy.Duration.hrs))
    Lower <- quartiles[1] - 1.5 * IQR
    Upper <- quartiles[2] + 1.5 * IQR
    Blink2 <- subset(Blink, Blink$Total.Time.hrs > Lower & Blink$Total.Time.hrs <
        Upper)
    Blink2 <- subset(Blink, Blink$Energy.Duration.hrs > Lower & Blink$Energy.Duration.hrs <
        Upper)

<table class="table table" style="margin-left: auto; margin-right: auto; margin-left: auto; margin-right: auto;">
<caption>
Summary of Blink Data by Parking Location
</caption>
<thead>
<tr>
<th style="text-align:left;">
Location.Name
</th>
<th style="text-align:right;">
Count of Charging Instances
</th>
<th style="text-align:right;">
Total Time (hrs)
</th>
<th style="text-align:right;">
Total Energy Duration (hrs)
</th>
<th style="text-align:right;">
Total Energy Use (kW)
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Portland State University
</td>
<td style="text-align:right;width: 1in; ">
148
</td>
<td style="text-align:right;width: 1in; ">
586.53
</td>
<td style="text-align:right;width: 1in; ">
351.64
</td>
<td style="text-align:right;width: 1in; ">
1549.79
</td>
</tr>
<tr>
<td style="text-align:left;">
Portland State University - Parking One
</td>
<td style="text-align:right;width: 1in; ">
25
</td>
<td style="text-align:right;width: 1in; ">
140.06
</td>
<td style="text-align:right;width: 1in; ">
56.08
</td>
<td style="text-align:right;width: 1in; ">
120.32
</td>
</tr>
<tr>
<td style="text-align:left;">
Portland State University - RMNC
</td>
<td style="text-align:right;width: 1in; ">
64
</td>
<td style="text-align:right;width: 1in; ">
235.10
</td>
<td style="text-align:right;width: 1in; ">
154.60
</td>
<td style="text-align:right;width: 1in; ">
765.17
</td>
</tr>
</tbody>
</table>

    # Maximum and Minimum values of numerical columns
    max_total_time <- max(Blink2$Total.Time.hrs, na.rm = TRUE)
    min_total_time <- min(Blink2$Total.Time.hrs, na.rm = TRUE)

    max_plug_duration <- max(Blink2$Plug.Duration, na.rm = TRUE)
    min_plug_duration <- min(Blink2$Plug.Duration, na.rm = TRUE)

    max_energy_duration <- max(Blink2$Energy.Duration.hrs, na.rm = TRUE)
    min_energy_duration <- min(Blink2$Energy.Duration.hrs, na.rm = TRUE)

    # Print the maximum and minimum values
    cat("Maximum Total.Time.hrs:", max_total_time, "\n")

    ## Maximum Total.Time.hrs: 22.36639

    cat("Minimum Total.Time.hrs:", min_total_time, "\n")

    ## Minimum Total.Time.hrs: 0.007777778

    cat("Maximum Plug.Duration (seconds...divide by 3600 for hrs):",
        max_plug_duration, "\n")

    ## Maximum Plug.Duration (seconds...divide by 3600 for hrs): 80519

    cat("Minimum Plug.Duration (seconds...-divide by 3600 for hrs):",
        min_plug_duration, "\n")

    ## Minimum Plug.Duration (seconds...-divide by 3600 for hrs): 28

    cat("Maximum Energy.Duration.hrs:", max_energy_duration, "\n")

    ## Maximum Energy.Duration.hrs: 9.451944

    cat("Minimum Energy.Duration.hrs:", min_energy_duration, "\n")

    ## Minimum Energy.Duration.hrs: 0

    # column to a date format
    Blink2$Connection <- as.Date(Blink2$Connection, format = "%A, %B %d, %Y")

    # day of the week
    Blink2$Day_of_Week <- weekdays(Blink2$Connection)

    # count occurrences of each day of the week
    day_counts <- table(Blink2$Day_of_Week)

    # display
    print(day_counts)

    ## < table of extent 0 >

    # converting to date format
    Blink2$Connection <- as.Date(Blink2$Connection, format = "%A, %B %d, %Y")

    # extract the day of the week
    Blink2$Day_of_Week <- weekdays(Blink2$Connection)

    # occurrences of each day of the week
    day_counts <- table(Blink2$Day_of_Week)

    # converting day_counts to a df
    day_counts_df <- as.data.frame(day_counts)
    names(day_counts_df) <- c("Day_of_Week", "Count")

    # bar plot
    ggplot(day_counts_df, aes(x = Day_of_Week, y = Count, fill = Day_of_Week)) +
        geom_bar(stat = "identity") + labs(title = "Occurrences on each day of the week",
        x = "DOW", y = "Count") + theme_minimal() + theme(axis.text.x = element_text(angle = 45,
        hjust = 1)) + scale_fill_discrete(name = "Day of the Week")

    # correct format
    Blink2$Connection <- as.Date(Blink2$Connection, format = "%A, %B %d, %Y")

    # group data by date and count occurrences per date
    date_occurrences <- Blink2 %>%
        group_by(Connection) %>%
        summarise(occurrences = n())

    # display
    print(date_occurrences)

    ## # A tibble: 1 × 2
    ##   Connection occurrences
    ##   <date>           <int>
    ## 1 NA                 237

    # maximum, median, and minimum occurrences
    occurrences_stats <- date_occurrences %>%
        summarise(max_occurrences = max(occurrences), median_occurrences = median(occurrences),
            min_occurrences = min(occurrences))

    # statistics
    print(occurrences_stats)

    ## # A tibble: 1 × 3
    ##   max_occurrences median_occurrences min_occurrences
    ##             <int>              <int>           <int>
    ## 1             237                237             237

    #  correct format
    Blink2$CTime <- as.POSIXct(Blink2$CTime, format = "%I:%M:%S %p")

    # plot
    ggplot(Blink2, aes(x = CTime, fill = Day_of_Week)) +
      geom_histogram(binwidth = 3600, #(1 hour = 3600 seconds)
                     color = "black",
                     alpha = 0.7) +
      facet_wrap(~Day_of_Week, ncol = 3) +
      labs(title = "Occurrences by DOW and Time",
           x = "Time",
           y = "Count") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))

    # correct format: character format, convert it to POSIXct
    Blink2$CTime <- as.POSIXct(Blink2$CTime, format = "%I:%M:%S %p")

    # group data by connection column and calculate mmm
    time_summary <- Blink2 %>%
        group_by(Day_of_Week) %>%
        summarise(greatest_time = max(CTime), median_time = median(CTime,
            na.rm = TRUE), least_time = min(CTime))

    print(time_summary)

### Data Analysis Summary:

From this analysis we conclude that the optimal number of chargers is 12
because it would sustain current demand and accomdate fluctuational
demand. Based on this analysis, the estimated general trend of demand
over 10 weeks is around 840 connections. Using Blink charging data, our
main objective was to identify demand for electric vehicle charging. The
blink charge data was collected from PSU Transportation and parking
Services. We analyzed data through August, September and October. Three
different PSU charging sites are listed in our data report. Portland
State University, Portland State University-Parking One, and Portland
State University RMNC are the three locations. We were able to determine
the duration of the car’s connection to the charging port based on the
provided data, which also included the day of the week, date, and time
of the connection as well as information about the disconnection. As a
result, we could observe the entire amount of time spent charging each
car.

The Data Report also included additional invoicing information and the
maximum power used by each car. Every record in the data had a serial
number that corresponded to the car’s connection to the charging port.
Based on the data given the car takes an average of four hours and five
minutes to charge. In our data, “occurrences” refers to the total number
of times the cars have used the charger connection. The resulting list
of occurrences showed that there were 20 on Monday, 42 on Tuesday, 37 on
Wednesday, 33 on Thursday, 36 on Friday, 50 on Saturday, and 19 on
Sunday.The total number of occurrences was 237, and when compared to the
other days of the week, we observed that Saturday has the highest number
of occurrences.

  
## Installation Optimization Model

To ensure we meet business needs as identified by our interview with
PSU’s Transportation and Parking department, our initial optimization
model focuses on centralizing PSU’s current charging demand in Parking
Structure 3. The model is heavily simplified to meet our capacity within
this project, and so does not take into account every factor that would
apply to the installation and costing process. Instead, we are focusing
on the following elements:

-   Purchase costs and charger storage
-   Installation labor costs
-   Timeline requirements
-   Available space for construction

Additionally, we have severe limitations on our data availability. The
Blink charging dataset is a representative subset of PSU’s full charging
needs and parking demand. However, we did not have access to additional
details on PSU’s parking demand and charging needs. As such, we used the
Blink data to extrapolate assumptions about the charging and parking
demand on campus, but additional details would be needed to complete the
picture. Along with that limitation, we did not have information on
authentic labor costs for installation when using PSU’s construciton
services, and so generated estimates based on our understanding of
construction expenses and from conversations with individuals who have
had other work completed by PSU in the past.

### Model Formulation:

Our model’s objective is to minimize costs, which are the sum of
installation and purchase costs. Our first constraint is that we must
install our required number of chargers (the demand) within our required
time limit. Outside of the constraints that set limitations on variables
(eg. binary vs. integer), the remaining constraints can be grouped as:

-   **Purchasing**: The total purchase price each week is the number of
    chargers purchased multiplied by the cost of each charger.
    Additionally, we are adding in a bulk-purchase discount, where
    purchasing 5 chargers provides a discount of 20% (i.e. the price of
    a charger). The total purchase cost per week subtracts the
    applicable discount from the cost of the purchased chargers for the
    week. The cost of the chargers, $300, was provided from our
    interview with Transportation and Parking, however the discount was
    an added feature included due to research into various charging
    companies.  
-   **Storage**: Inventory management is an important element of any
    installation process, and so we wanted to be sure to include it in
    this project. However, this was an area where we had limitations on
    data. As such, we set an estimated limit of the number of chargers
    available to store at one time as a means of controlling how many
    could be purchased and installed each week. We also estimated that
    there were already a certain number of chargers in storage,
    available for install on week 1. We then established constraints
    around charger inventory at the end of each week, based on the
    number of chargers at the start of the week, how many were
    installed, and how many were purchased.  
-   **Installation**: Our installation costs were another area of
    limited data. However, it is important to take into account the cost
    of labor in a model such as this, as skilled installation is often
    quite a bit more than the cost of the product itself. Using our
    familiarity with general construction practices, we established a
    base installation fee which is charged no matter the number of
    chargers installed (so long as it’s more than 0), to account for the
    work that must be done whether 1 or 20 chargers are installed in a
    given week. Added to that is a per-charger installation cost to
    account for the increase in work. We also set a limit on the number
    of chargers that could be installed each week, as well as
    limitations on how much space could be used for construction,
    identified as a count of parking spaces (assuming a certain number
    of surrounding spaced would be used for each install) with the
    limitation based on an estimated percent of available space in the
    parking garage for a given week during the term.

![Model Formulation](EV_Charging_Optimization_files/model_formulation.png)

**Variables Reference:**

-   Charger Tracking:
    -   D = Total chargers to install
    -   B<sup>S</sup> = Starting inventory of chargers (week 0)
    -   x<sub>t</sub> = Chargers installed on week t
    -   y<sub>t</sub> = Chargers purchased in week t
    -   z<sub>t</sub> = Stored chargers at the end of week t
-   Costs:
    -   B<sup>I</sup> = Base cost for install
    -   C<sup>I</sup> = Per-charger install cost
    -   C<sup>Ti</sup><sub>t</sub> = Total install cost for week t
    -   C<sup>P</sup> = Per-charger purchase cost
    -   C<sup>Tp</sup><sub>t</sub> = Total purchase costs for week t
-   Limits:
    -   L<sup>I</sup> = Weekly install limit
    -   L<sup>S</sup> = Charger storage limit
    -   L<sup>A</sup><sub>t</sub> = Limit available area for
        construction for week t
-   Weights:
    -   W<sup>I</sup><sub>t</sub> = Install binary for week t
    -   W<sup>P</sup><sub>t</sub> = Discount binary for week t
    -   W<sup>A</sup> = Weight of spaces to be used

### Model Implementation:

For our implementation, we are setting external variables based on
calculated (from the Blink), provided (from the PSU interview), or
estimated values as previously discussed. The initial model uses Parking
Structure 3 as the location for installation, chosen due to our
conversation with Transportation and Parking. Our limits on how much of
the parking structure is available for construction, as well as our
demand, are extrapolations from the Blink charging data while the
per-charger purchase cost was provided by Transportation and Parking.
All other inputs are estimates.

    lot <- 1300 #total spaces in parking structure 3
    D <- 12  #total chargers to install
    BS <- 2 #starting inventory of chargers
    LI <- 3 #max chargers to install each week
    LS <- 5 #max inventory capacity for chargers
    CI <- 2000 #per charger install labor cost
    CP <- 300 #per charger purchase cost
    WA <- 5 #average area used during install (parking spaces)
    BI <- 5000 #base cost of install

    #percent of lot available for construction, capped at 50%
    LA <- c(lot*.5, #pre-term
            lot*0, lot*.0, lot*.19, lot*.29, lot*.40, #weeks 1-5 of term
            lot*.37, lot*.35, lot*.39, lot*.31, lot*.32, #weeks 6-10 of term
            lot*.0) #finals week

    weeks <- length(LA) #completion time (weeks)

    model <- MIPModel() |>
      add_variable(Vx[t], t=1:weeks, type="integer", lb = 0, ub = LI)   |> #var: install/week
      add_variable(Vy[t], t=1:weeks, type="integer", lb = 0)            |> #var: purchases/week
      add_variable(Vz[t], t=1:weeks, type="integer", lb = 0, ub = LS)   |> #var: chargers stored/week
      add_variable(VCTi[t], t=1:weeks, type="continuous", lb = 0)       |> #var: total install/week
      add_variable(VCTp[t], t=1:weeks, type="continuous", lb = 0)       |> #var: total purchase/week
      add_variable(VWp[t], t=1:weeks, type="binary")                    |> #var: bulk discount activator
      add_variable(VWi[t], t=1:weeks, type="binary")                    |> #var: base install binary
      set_objective(sum_expr(VCTi[t]+VCTp[t], t=1:weeks), "min")        |> #obj: min costs
      add_constraint(sum_expr(Vx[t], t=1:weeks)==D)                     |> #con: install total demand
      add_constraint(Vz[t-1]+Vy[t]-Vx[t] == Vz[t], t = 2:weeks)         |> #con: weeks 2+ stored chargers
      add_constraint(BS+Vy[t]-Vx[t] == Vz[t], t = 1)                    |> #con: week 1 stored chargers
      add_constraint(Vx[t] <= Vz[t-1], t = 2:weeks)                     |> #con: weeks 2+ install limit 
      add_constraint(Vx[t] <= BS, t = 1)                                |> #con: week 1 install limit
      add_constraint(Vx[t]*WA <= LA[t], t = 1:weeks)                    |> #con: construction area limit
      add_constraint(Vx[t]-D*VWi[t] <= 0, t = 1:weeks)                  |> #con: base charge if installing
      add_constraint(Vx[t]*CI+VWi[t]*BI == VCTi[t], t = 1:weeks)        |> #con: installation cost/week 
      add_constraint(Vy[t]-5*VWp[t]>=0, t = 1:weeks)                    |> #con: bulk discount
      add_constraint(Vy[t]*CP - CP*VWp[t] == VCTp[t], t = 1:weeks)         #con: purchase cost/week

    model_res <- solve_model(model, with_ROI(solver = "glpk"))

### Model Solution:

The solution for this model has four installation weeks, with each week
using the full limit of possible installations (3). This minimizes the
number of base installation charges incurred, which are one of the
primary cost drivers for the installation costs. For purchasing
chargers, the model only purchases enough to meet the discount threshold
once, indicating that the purchase costs are not an overall cost driver
to the installation plan. The total expense for installation using this
model would be $46,700, including both installation and purchase costs,
with a completion date of the last week of term.

One thing to note with this plan is that the total space avaiable for
construction, excluding the weeks when we set availability to 0, did not
appear to be a limiting factor. By capping installations at 3 per week,
we are at maximum using 15 spaces for a given week’s installation.
Outside of the weeks when availability was set to 0, the week with the
least available space was week 3 of term, with 19% of the lot available
for construction. In a lot with 1,300 spaces, that’s 247 spaces
available for construction, well above the threshold established by our
installation limits.

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>
One Term Charger Install Plan, Parking Structure 3
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:center;">
No Classes
</th>
<th style="text-align:center;">
Week 1
</th>
<th style="text-align:center;">
Week 2
</th>
<th style="text-align:center;">
Week 3
</th>
<th style="text-align:center;">
Week 4
</th>
<th style="text-align:center;">
Mid Terms
</th>
<th style="text-align:center;">
Week 6
</th>
<th style="text-align:center;">
Week 7
</th>
<th style="text-align:center;">
Week 8
</th>
<th style="text-align:center;">
Week 9
</th>
<th style="text-align:center;">
Week 10
</th>
<th style="text-align:center;">
Finals
</th>
<th style="text-align:center;">
TOTAL
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Install Count
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
12
</td>
</tr>
<tr>
<td style="text-align:left;">
Purchased Chargers
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
5
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
10
</td>
</tr>
<tr>
<td style="text-align:left;">
Stored Chargers
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
5
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">

-   </td>
    </tr>
    <tr>
    <td style="text-align:left;">
    Labor Costs
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    11000
    </td>
    <td style="text-align:center;">
    11000
    </td>
    <td style="text-align:center;">
    11000
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    11000
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    44000
    </td>
    </tr>
    <tr>
    <td style="text-align:left;">
    Purchase Costs
    </td>
    <td style="text-align:center;">
    300
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    900
    </td>
    <td style="text-align:center;">
    1200
    </td>
    <td style="text-align:center;">
    300
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    2700
    </td>
    </tr>
    <tr>
    <td style="text-align:left;">
    TOTAL Costs
    </td>
    <td style="text-align:center;">
    300
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    11900
    </td>
    <td style="text-align:center;">
    12200
    </td>
    <td style="text-align:center;">
    11300
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    11000
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    46700
    </td>
    </tr>
    </tbody>
    </table>

## Alternative Solution:

We wanted to posit an alternative solution to moving all charging demand
to Parking Structure 3, though. That parking structure has severe
limitations related to location and open hours which could present
barriers for commuters to use that as their primary parking location.
There is, however, another parking structure closer to the center of
campus, the underground Fourth Avenue Building (FAB) parking lot. This
lot is smaller in capacity, with a total of 430 spaces, but also
contains both hourly and monthly parking options and (based on our
personal observances) is rarely filled to capacity. As such, this could
be an excellent alternative location for centralized EV charging.

The formulation for the model remains as listed above, as this is a
generalized model. As such, for the sake of space, we will not repeat
the model formulation here.

### Alternative Location Model:

With the implementation, there are also no adjustments to the actual
model build itself. Rather, all adjustments come from the external
variables. As such, again for the sake of space, we will omit displaying
the implementation for the alternative model, and instead focus on the
changes to the external variables.

When working with the FAB parking structure, there are two things we
need to take into account. The first is that is it a much smaller
structure, with 430 spaces compared to Parking Structure 3’s 1300
spaces. The other is that this parking structure has much higher
employee commuter usage and reduced public usage, due to it’s location
and lack of publicity. To support both of these concerns, we drastically
reduced the amount of available space for construction during the term
to be 2% of the total lot size, and adjusted the off-term availability
to be 5% of the total lot size. This is because, while there are student
commuters that use this lot, we wanted to ensure enough standard parking
was available for employees who continue to commute to campus even when
school is not in session.

    lot <- 430 #total spaces in parking structure 3
    D <- 12  #total chargers to install
    BS <- 2 #starting inventory of chargers
    LI <- 3 #max chargers to install each week
    LS <- 5 #max inventory capacity for chargers
    CI <- 2000 #per charger install labor cost
    CP <- 300 #per charger purchase cost
    WA <- 5 #average area used during install (parking spaces)
    BI <- 5000 #base cost of install

    #percent of lot available for construction, capped at 50%
    LA <- c(lot*.05, #pre-term
            lot*.02, lot*.02, lot*.02, lot*.02, lot*.02, #weeks 1-5 of term
            lot*.02, lot*.02, lot*.02, lot*.02, lot*.02, #weeks 6-10 of term
            lot*.02) #finals week

    weeks <- length(LA) #completion time (weeks)

### Alternative Location Solution:

By forcing the single term install in the FAB parking structure, as a
reflection of our original modeling for Parking Structure 3, our total
costs increased by approximately $25,000. This is due to the cap on
available space throughout the term, which forced the model to have more
frequent installs of just a single charger, thereby increasing the total
count of base install fees. To minimize costs as best as possible the
model moved to two bulk purchases of charges (rather than more frequent
smaller purchases). However, that is a minimal savings ($600) when
compared to the total cost of the installation project.

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>
One Term Charger Install Plan, FAB Parking
</caption>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:center;">
No Classes
</th>
<th style="text-align:center;">
Week 1
</th>
<th style="text-align:center;">
Week 2
</th>
<th style="text-align:center;">
Week 3
</th>
<th style="text-align:center;">
Week 4
</th>
<th style="text-align:center;">
Mid Terms
</th>
<th style="text-align:center;">
Week 6
</th>
<th style="text-align:center;">
Week 7
</th>
<th style="text-align:center;">
Week 8
</th>
<th style="text-align:center;">
Week 9
</th>
<th style="text-align:center;">
Week 10
</th>
<th style="text-align:center;">
Finals
</th>
<th style="text-align:center;">
TOTAL
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Install Count
</td>
<td style="text-align:center;">
2
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
12
</td>
</tr>
<tr>
<td style="text-align:left;">
Purchased Chargers
</td>
<td style="text-align:center;">
5
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
5
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">
10
</td>
</tr>
<tr>
<td style="text-align:left;">
Stored Chargers
</td>
<td style="text-align:center;">
5
</td>
<td style="text-align:center;">
4
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
2
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
5
</td>
<td style="text-align:center;">
4
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
3
</td>
<td style="text-align:center;">
2
</td>
<td style="text-align:center;">
1
</td>
<td style="text-align:center;">
0
</td>
<td style="text-align:center;">

-   </td>
    </tr>
    <tr>
    <td style="text-align:left;">
    Labor Costs
    </td>
    <td style="text-align:center;">
    9000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    79000
    </td>
    </tr>
    <tr>
    <td style="text-align:left;">
    Purchase Costs
    </td>
    <td style="text-align:center;">
    1200
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    1200
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    2400
    </td>
    </tr>
    <tr>
    <td style="text-align:left;">
    TOTAL Costs
    </td>
    <td style="text-align:center;">
    10200
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    8200
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    0
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    7000
    </td>
    <td style="text-align:center;">
    81400
    </td>
    </tr>
    </tbody>
    </table>

## Discussion

At first blush, the alternative location appears to be a worse choice
due to the added limitations on construction space. After all, based on
our two implementation options, we can determine that a fast,
single-term, roll-out of charger installations in an under-utilized
parking structure is feasible given our assumptions of charging demand.
And when given the option between two installations that vary by about
$25,00, it seems like the optimal choice is obvious: centralize EV
charging locations in Parking Structure 3. However, the initial numbers
are only part of the story.

With that understanding, we reached out to various EV drivers who
commute to campus on a regular basis to understand their barriers to
charging on campus, and their impression of the current infrastructure.
From those conversations, we have garnered the impression that the
biggest barrier to EV charging on campus for commuters is lack of
availability for monthly permit holders. According to one individual who
holds a monthly permit, all EV spaces are in hourly parking and when
parking with their permit in those spaces they were ticketed for doing
so, since they hadn’t paid for the hourly parking. It does appear that
the bulk, if not all, of PSU’s EV charging spaces are relegated to
hourly parking locations. Regular campus commuters are more likely to
use monthly or term-based parking permits, rather than using hourly
parking. If they are already paying for a space, there is no incentive
to then pay a second time for charging at a Level 1 charger.

As indicated in our literary reviews, EV ownership is on the rise,
particularly in the Portland Metro Area. We as a university need to
determine a charging solution that fits the authentic needs of campus
commuters, rather than focusing on data collected from hourly parking
locations as that is less likely to demonstrate the needs of our daily
commuters. Our recommendation would be to spend additional time learning
about the driving habits of the true campus commuters, ones who hold
monthly or term-based parking permits, to determine and work to meet
their EV charging needs. From that, we would recommend creating a
charger location and installation plan that supports those commuters,
ensuring that monthly or term-based permit holders have equitable access
to EV charging. While considering these options, we would also encourage
the university to conduct a deeper analysis into options related to some
of our smaller garages, rather than the main parking structures, as
those lots would allow the university to continue to focus on general
parking in the main lots and potentially re-purpose some of the smaller
lots to support the growing base of EV drivers.

## References

-   “2023 Biennial Zero-Emission Vehicle Report.” 2023, September.
    <https://www.oregon.gov/energy/Dataand-Reports/Documents/2023-Biennial-Zero-Emission-Vehicle-Report.pdf>.

-   Ahmad, Fareed, Atif Iqbal, Imtiaz Ashraf, Mousa Marzband, and Irfan
    khan. 2022. “Optimal Location of Electric Vehicle Charging Station
    and Its Impact on Distribution Network: A Review.” Energy Reports 8:
    2314–33.
    <https://doi.org/https://doi.org/10.1016/j.egyr.2022.01.180>.

-   “CAMPUS BUILDINGS.” n.d. Portland State University.
    <https://www.pdx.edu/buildings/?facility_features%5B701%5D=701&page=0>.

-   “Charger Types and Speeds.” 2023. US Department of Transportation.
    <https://www.transportation.gov/rural/ev/toolkit/ev-basics/charging-speeds>.

-   David Howell, Brian Cunningham, Steven Boyd. 2017. “Enabling Fast
    Charging: A Technology Gap Assessment.” Office of Energy Efficiency
    & Renewable Energy, September.
    <https://www.energy.gov/sites/prod/files/2017/10/f38/XFC%20Technology%20Gap%20Assessment%20Report_FINAL_10202017.pdf>.

-   “Developing Infrastructure to Charge Electric Vehicles.” n.d. US
    Department of Energy.
    <https://afdc.energy.gov/fuels/electricity_infrastructure.html>.

-   “Electric Vehicles.” n.d. International Energy Agency.
    <https://www.iea.org/energy-system/transport/electric-vehicles>.

-   “FACTS : PSU BY THE NUMBERS.” n.d. Portland State University.
    <https://www.pdx.edu/portlandstate-university-facts.12>

-   “HOURLY & VISITOR PARKING.” n.d. Portland State University.
    <https://www.pdx.edu/transportation/hourly-visitor-parking>.

-   Lee, Jae Hyun, Debapriya Chakraborty, Scott J. Hardman, and Gil
    Tal. 2020. “Exploring Electric Vehicle Charging Patterns: Mixed
    Usage of Charging Infrastructure.” Transportation Research Part D:
    Transport and Environment 79: 102249.
    <https://doi.org/https://doi.org/10.1016/j.trd.2020.102249>.

-   Moradijoz, M., F. Moazzen, S. Allahmoradi, M. Parsa Moghaddam,
    and M. R Haghifam. 2018. “A Two Stage Model for Optimum Allocation
    of Electric Vehicle Parking Lots in Smart Grids.” In 2018 Smart Grid
    Conference (SGC), 1–5. <https://doi.org/10.1109/SGC.2018.8777877>.

-   “PSU Employee Headcount.” 2023. Portland State University.
    <https://public.tableau.com/app/profile/portland.state/viz/PSUEmployeeHeadcount/About>.

-   Simorgh, Hamid, Hasan Doagou-Mojarrad, Hadi Razmi, and Gevork B.
    Gharehpetian. 2018. “CostBased Optimal Siting and Sizing of Electric
    Vehicle Charging Stations Considering Demand Response Programmes.”
    IET Generation, Transmission & Distribution 12 (8): 1712–20.
    <https://doi.org/https://doi.org/10.1049/iet-gtd.2017.1663>.

-   Zhou, Min, Piao Long, Nan Kong, Lindu Zhao, Fu Jia, and Kathryn S
    Campy. 2021. “Characterizing theMotivational Mechanism Behind Taxi
    Driver’s Adoption of Electric Vehicles for Living: Insights from
    China.” Transportation Research Part A: Policy and Practice 144:
    134–52.
