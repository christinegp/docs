---
title: Tiering Rules
layout: page
categories: ["Guides"]
---
# Tiering Rules
Create tiers to divide members into a hierarchy. Tier rules define the criteria for advancing from one tier to the next. Create tiers and tier rules on the Rules | Tier Rules screen. You can specify both basic and advanced tier rules. If more than one tier is applicable, the member is awarded the best tier they are eligible for.

## Basic Tiering Rules
Basic tier rules are represented in a table of thresholds. Each tier has a display name, internal name, description, and metric associated with it. Craft descriptions that differentiate each tier from each other and specify additional benefits. The metric (usually points) that is associated with advancing tiers can be edited and new metrics can be created on the Program | Member Metrics screen.

Add more columns to the table in order to create new thresholds that need to be met to advance tiers. The new column can represent a metric, metric group, or expression. Add a new *metric* column to create a new threshold that must be met in order to advance to that tier. Add a new *metric group* column to create a group of thresholds, any *one* of which need to be satisfied, as a prerequisite to advancing to that tier. Add a new *expression* column in order to add additional information about each tier (which is purely descriptive and has no bearing on the calculations).

### Basic Tiering Rule Examples
<!-- Need to fill out -->

## Advanced Tiering Rules
Specify advanced tiering rules to allow tiering up at non-conventional times such as during a promotion. The *condition* column gives the constraints necessary in order to be eligible to advance to a specified tier (outside of the basic tiering rules). Conditions can be authored as a template or an expression. <!-- What is the difference between the two/what do they mean? --> If multiple conditions are specified, all of them must be true for the condition to be met. The *results* column allows you to specify which tier the advanced rule applies to and the expiration of the rule. <!-- Simple vs. Advanced tier? --> (See more about tier expiration below, under *Tier Period and Expiration*.)

## Effectivity and Status
Change the **status** of an advanced tier rule in order to make the rule active:

* *Draft*: The rule is inactive. Edit the rule on the console in *draft* mode.

* *Published*: The rule is active. However, just because a rule is published does not mean that it applies. In order to apply to the user to advance a tier, the rule must be published *and* fall in the effective time frame (see *effectivity* below).

* *Archived*: The rule is inactive and no longer applies to users. You can still view all archived rules on the console.

Change the **effectivity** of an advanced tier rule to designate the time frame for which the rule applies:

* *Always*: The rule always applies until it is manually archived.

* *Schedule*: Customize the time frame that the rule is applied. Includes the capability to have recurring rules at specified times. For example, if you wanted to have a promotion every January, you could create a recurring rule that is only active during the month of January.

### Advanced Tiering Rule Examples
<!-- Need to fill out -->

## Tier Period and Expiration
Edit the settings for tier expiration on the Rules | Settings | Tier Rule Settings screen. Specify the **default period**, which is the period over which metric values are summed and accounted for in tier rule calculations. Default periods include a calendar year/month or a rolling year/month. In other words, the former restarts the totals at the beginning of each calendar year/month while the latter keeps a running total, constantly recalculating to account for the past year/month.

You can also specify the **default expiration**, which is the expiration period for a tier value unless otherwise specified in the tier rule. Determine how long the expiration period is with an expiration value (a numerical value) and an expiration metric (days, months, or years). For example, a value of '1' and a metric of 'Years' would set the expiration period at 1 year. You can also set the expiration to be calculated either from the end of a period or the most recent tier change.

Edit the tier expiration for advanced tier rules by editing the *results* column of an advanced tier rule. The expiration period can be set to default (changeable under Rules | Settings | Tier Rule Settings), on date (in which you can input a specific date for expiration), or from tier change (in which you can input a duration until expiration).

## Also See
[Calculation Functions](/docs/reference/calc_fns)