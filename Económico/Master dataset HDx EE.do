*************************
*Economic evaluation HDx*
*************************

*Open master dataset
use "C:\Users\arizaj\OneDrive - Baxter\REGIONAL REIMBURSEMENT\RTS\THERANOVA\Master dataset HDx EE.dta", clear
browse

*Baseline demographics
. mean Age, over(Treatment)
. proportion Gender, over(Treatment)
*Comorbidities
. proportion Dx_HTA Dx_DM Dx_CVD, over(Treatment)
. tabulate Index_Charlson
. mean Karnosfky, over(Treatment)
*Health resources consumption
. sktest Hosp_episode_yr Hosp_days_yr Dosage_UI_EPO Dosage_Iron Dosage_diuretic
. pwmean Hosp_episode_yr, over(Treatment) cieffects pveffects cimeans sort
. glm Hosp_episode_yr Treatment, family(poisson) link(identity)
. pwmean Hosp_days_yr , over(Treatment) cieffects pveffects cimeans sort
. glm Hosp_days_yr Treatment, family(poisson) link(identity)
. pwmean Dosage_UI_EPO, over(Treatment) cieffects pveffects cimeans sort
. glm Dosage_UI_EPO Treatment, family(poisson) link(identity)
. pwmean  Dosage_Iron, over(Treatment) cieffects pveffects cimeans sort
. glm Dosage_Iron Treatment, family(poisson) link(identity)
. pwmean  Dosage_diuretic , over(Treatment) cieffects pveffects cimeans sort
. glm Dosage_diuretic Treatment, family(poisson) link(identity)

*Dialysis sessions mean comparison
. pwmean  n_sesiones , over(Treatment) cieffects pveffects cimeans sort
*Quality Adjusted Life Years Valuation (Shefield algorithm)
. sktest EQ5D_Spain LN_EQ5D_Spain
. symplot EQ5D_Spain
. pnorm EQ5D_Spain
. pnorm LN_EQ5D_Spain
. pwmean EQ5D_Spain, over(Treatment) cieffects pveffects cimeans sort
. glm EQ5D_Spain Treatment, family(gamma) link(identity)
. glm EQ5D_Spain Treatment Age Years_dialysis Index_Charlson Karnosfky Hosp_days_yr, family(gamma) link(identity)
. regress EQ5D_Spain Treatment
. regress LN_EQ5D_Spain Treatment
*Quality Adjusted Life Years Valuation (SF12 Mapping Algorithm)
. sktest EQ5D_SF12
. symplot EQ5D_SF12
. pnorm EQ5D_SF12
. pwmean EQ5D_SF12, over(Treatment) cieffects pveffects cimeans sort
. glm EQ5D_SF12 Treatment, family(gamma) link(identity)
. glm EQ5D_SF12 Treatment Age Years_dialysis Index_Charlson Karnosfky Hosp_days_yr, family(gamma) link(identity)
. regress EQ5D_SF12 Treatment
*Cost Valuation
. pwmean hosp_cost , over(Treatment) cieffects pveffects cimeans sort
. glm hosp_cost Treatment, family(gamma) link(identity)
. pwmean EPO_cost , over(Treatment) cieffects pveffects cimeans sort
. glm EPO_cost Treatment, family(gamma) link(identity)
. pwmean Iron_cost , over(Treatment) cieffects pveffects cimeans sort
. glm Iron_cost Treatment, family(gamma) link(identity)

. pwmean overall_cost , over(Treatment) cieffects pveffects cimeans sort
. glm  overall_cost Treatment, family(gamma) link(identity)
