# Implementing ABC at Tidal Cloud Inc

## Background

Tidal Cloud Inc (Tidal) is a hosting provider that offers both managed
hosting using physical servers as well as cloud-based hosting with two
unique service offerings: public cloud and private cloud (Marea Cloud).
Public cloud uses shared cloud servers to manage data, while Marea Cloud
offers private servers for each client, a benefit for clients that need
to ensure the privacy and security of their data. This company is facing
pressure from its investors to increase profit margins as a means to
start creating an exit strategy for the company. The end goal is to
demonstrate the best profitability they can, to make the most out of
selling the company. To help with this process Tidal began heavily
investing in cloud infrastructure as that technology became increasingly
popular, but their competitors are lowering prices on public cloud
services at a time when Tidal's profit margins on those services are
already tight. However, they've been able to increase pricing on their
private cloud hosting service, Marea Cloud, without a drop in customer
base. The managed hosting service is essentially in a "set it and forget
it" status, where their customer base is stable provided nothing goes
wrong, and they're not looking to increase that service due to concerns
around resiliency.

According to Tidal's existing simple cost system, which allocates a
percentage of indirect budget expenses to each service according to the
number of virtual servers in use at the end of each month per service,
while also accounting for direct costs in the form of equipment leasing.
Under that cost system, the company is operating at a 2% profit margin,
managed hosting operating at a 3% profit margin, public hosting
operating at a loss with -5.6% and Marea Cloud having the best profit
margin of 13.7% (see Appendix I). There are two main issues with this
simplified costing method, though. First, the managed services don't
actually use virtual servers and so their operating expenses have to be
assumed. Second, allocation of budget is based on virtual machines, but
in the public cloud service, virtual machines may be shared while in the
private model they are always individual to the company. As such,
allocating based on virtual machine does not account for actual
expenses.

## Recommendation

By using Activity Based Costing, Tidal would be able to identify true
operating costs for each service and get a more accurate picture of
their profit margins for each service. Appendix II shows what the
activity rate is for each cost driver accounted for within the
previously mass-allocated indirect costs, as well as the source data for
those rates which shows how many "units" of each cost driver the
different products used. When multiplying the activity rates by the
units of each rate used per product, you get the ABC method of costing,
shown in Appendix III. Using this method, the profit margins look very
different, with managed hosting operating at a 14.03% profit margin,
public cloud operating with a 5.3% profit margin, and Marea Cloud
operating at a loss of 11.36%. Using this information, Tidal can make
more informed business decisions since what was previously shown as
their primary profit driver, Marea Cloud, is actually their loss leader.

## Appendices

### Appendix I: Simple Cost System

*Product Profitability for Month Ended June 30, 2016*

|  | **Company**   | **Managed Hosting** | **Public Cloud** | **Marea Cloud** |
|---|---|---|---|---|
| *Sales*    |   *$950,000*  |  *$191,900*  | *$469,300*  | *$288,800* |
| Equipment Leasing   |   $(237,500)  |  $(47,500)   |  $(114,000)  | $(76,000)   |                                          
| Allocated Indirect Costs    |  $(693,500)  |  $(138,700)  |  $(381,425) |  $(173,375)  |                                         
| Operating profit before SG&A |  $19,000   |     $5,700   |   $(26,125)   |   $39,425 |
| **Profit Margin**    |   **2.0%**    |   **3.0%**    |   **(5.6%)**  |   **13.7%** |                                             

### Appendix II: Activity Rates & Cost Drivers

**Activity Rates**

|  | **Activity Rate**  |   **Unit** |
|---|---|---|
|Provide Computing Resources    |    $6.33        |        VM       |                              
|Process Payments    |     $0.02         |       Dollar Earned |
|Onboard New Customers  |  $72.44     |          Hour |
|Support Existing Customers     |    $103.61        |      Help Ticket  |                                    
|Build & Improve Products | $54.15         |      Code Commit |
Advertise & Promote    |  $855.00       |       Percent of Spending |

**Budgeted Quantity of Activity Driver**                            

| **Core Activities**     |     **Budgeted** |  **Activity Driver (per month)** |  **Company**  | **Managed Hosting** |  **Public Cloud**   |  **Marea Cloud** |
|---|---|---|---|---|---|---|
|  Provide Computing Resources     |    $228,000  |   Number of VMs at month end    |  36,000    |    7,200  |    19,800    |   9,000|
|  Process Payments     |     $19,000   |   $ Sales   |  $950,000  |  $191,900  | $469,300 |  $288,800|
|  Onboard New Customers    |   $86,925  |  Hours spent onboarding new VMs   |   1,200      |   60      |    420      |   720|
|  Support Existing Customers      |    $165,775  |  Help tickets addressed  |   1,600       |  480       |  640       |  480|
|  Build & Improve Products     |     $108,300   |  Number of code commits  |    2,000    |     100    |     800     |   1,100|
|  Advertise & Promote   |   $85,500    |  Targeted ratio of spending   |    100      |    10       |   65      |    25|

### Appendix III: Activity Based Costing

| **Cost Drivers**      |   **Managed Hosting**    |  **Public Cloud**| **Marea Cloud** | **Company**|                                   
|-------------- |---------------| ---------------- |---------------- |---------------|
|Equipment Leasing (Direct)    |  $(47,500)   |   $(114,000)   |   $(76,000)   |    $(237,500)|
|Provide Computing Resources    |   $ (45,600.00)|  $(125,400.00)  | $(57,000.00) |   $(228,000)|
|Process Payments     |  $(3,838.00)  |  $(9,386.00)    | $(5,776.00)    | $(19,000)|
| Onboard New Customers |  $(4,346.25) |   $(30,423.75)  |  $(52,155.00)   | $(86,925)|                                                       
|Support Existing Customers    |   $(49,732.50)  | $(66,310.00)  |  $(49,732.50)  |  $(165,775)|
|Build & Improve Products     |  $(5,415.00)  |  $(43,320.00) |   $(59,565.00)  |  $(108,300)|                                                        
|Advertise & Promote |  $(8,550.00)   | $(55,575.00)  |  $(21,375.00)  |  $(85,500)|                                                      
|*Total*      |  $(164,982)   |  $(444,415)    |  $(321,604)   |   $(931,000)|

                                                                   

| |          **Managed Hosting**    |   **Public Cloud**| **Marea Cloud** | **Company**     |                          
|---|---|---|---|---|
|Sales     |     $191,900     |  $469,300      |  $288,800    |    **$950,000**|
|**Operating Profit**  |  **$26,918**   | **$24,885**    | **$(32,804)**  | **$19,000**      |                                               
|Profit margin | 14.03%     |     5.30%    |        (11.36%)    |      **2.00%**|
