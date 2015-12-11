---
title: Calculation Functions
layout: page
---
# Calculation Functions


## Member

These functions get information about the current member.

### Member Profile

#### getMemberValue ('attribute_name')

Returns the value of 'attribute_name' for member. 
	
	getMemberValue('state') == 'CA'

#### getPreferenceValue ('preference_name')

Returns the value for single-value preference 'preference_name'

#### getPreferenceValues ('preference_name')

Returns the list of values for multi-value preference 'preference_name'

#### existPreferenceValue ('preference_name', 'value')

Checks if 'value' is one the preference values for 'preference_name'

	existPreferenceValue ('preferred_stores', 'San Mateo')

#### countPreferenceValue ('preference_name')

Counts the number of preference values for 'preference_name'
	
	countPreferenceValue ('preferred_stores') > 2

### Member Tier

#### getMemberTier ()
	
Returns the name of member's current tier

#### isMemberTier ('tier_name')
	
Checks if member's tier name matches 'tier_name' parameter.

### Member Segments

#### getMemberSegments ()

Returns list of all segments that member belongs to.

#### isMemberSegment ('segment_name')

Checks if member belongs to segment 'segment_name'.

### Member Metrics

#### getMemberMetric ('metric_name')

Returns the current *life time earned* value for metric 'metric_name'. 'metric_name' can be a metric or activity type name.

	//Get lifetime earned value for metric point
	getMemberMetric('point')

#### <a name="metric"></a>getMemberMetric ('metric_name', 'period')

Returns the earned value for metric 'metric_name' over 'period'. 'period' parameter may be either an explicit period or one of the predefined period strings. Please see [Specifying Time Periods](#period) for details. 
	
	//Get year-to-date earned value for metric point
	getMemberMetric('point', 'ytd')
	//Get earned value over last 5 days for metric point
	getMemberMetric('point', 'last5d')
	//Get earned value between 01/01/2015 and 03/31/2015 for metric point
	getMemberMetric('point', '01/01/2015-03/31/2015')

#### getFilteredMetric ('metric_name', filter, 'period')

Same as [getMemberMetric](#metric) but computes the earned value of the metric from only activities matching the groovy expression specified in filter.  
	
	//get year=to-date eaned value for metric point including only earnings from activities with spend > 300
	getFilteredMetric("point", {activity-> activity.spend > 300}, 'ytd') 

## Current Activity

These calculation functions get information for the current activity, that is, the activity being processed.

### Header Attributes

#### getActivityValue ('attribute_name')

Return the value of header attribute 'attribute_name' for current activity

	getActivityValue ('spend')

### Line Item Attributes

These functions apply to activities that include line item attributes such as a purchase activity that includes list of items purchased

	
#### countActivityItems ()

Number of line items in current activity

#### countActivityItems (filter)

Number of line items in current activity matching filter 'filter'.

	count ({item-> item.sku == 'SKU001'})

### sumActivityItems (expr)

Compute the expression 'expr' (a Groovy closure) for each line item, and return the sum of all of them.

	sumActivityItems ({item-> item.price * item.quantity})

### sumActivityItems (expr, filter)

Compute the expression 'expr' for each line item matching filter 'filter', and return the sum of all of them.

	sumActivityItems ({item-> item.price * item.quantity}, {item-> item.sku == 'SKU001'})

### maxActivityItems (expr)

Compute the expression 'expr' for each line item, and return the maximum value among them.

### maxActivityItems (expr, filter)

Compute the expression 'expr' for each line item matching filter 'filter', and return the maximum value among them.

### minActivityItems (expr)

Compute the expression 'expr' for each line item, and return the minimum value among them.

### minActivityItems (expr, filter)

Compute the expression 'expr' for each line item matching filter 'filter', and return the minimum value among them.

### avgActivityItems (expr)

Compute the expression 'expr' for each line item, and return the average value of them.

### avgActivityItems (expr, filter)

Compute the expression 'expr' for each line item matching filter 'filter', and return the average value of them.

## Previous Activities

These functions operate on previously processed member activities.

#### countHistoryItems ('activityType', 'period')

Return the count of activities of type 'activityType' in period 'period'.

	// Number of purchases this year
	countHistoryItems (
		'purchase', 'ytd')

#### sumHistoryItems ('activityType', 'attributeName', 'period')

Return the sum of values for attribute 'attributeName' for activities of type 'activityType' in period 'period'. "attributeName"
could be a header attribute for an activity, or a metric. 

	// Total spend from purchases
	sumHistoryItems (
		'purchase', 'spend', 'ytd')


#### minHistoryItems ('attributeName', 'period')
#### maxHistoryItems ('attributeName', 'period')

#### countHistoryItemsWithFilter('activityType', filter, 'period')

Return the count of activities of type 'activityType' in period 'period' matching filter 'filter'.

	countHistoryItemsFilter (
		'purchase',
		{activity-> activity.spend > 10},
                'ytd')

## Lookups

Lookups provide the capability to extract some calculation logic in tables. A lookup table has one or more key columns, and one or more value columns. 
An example lookup table, where 'member_tier' and 'booking_code' are keys and 'bonus' and 'point_bonus' is value:

| member_tier | booking_code | bonus | point_bonus
|-------------|--------------|------ | -------------
| Silver      | E            | 0.10  | 0.05
| Silver      | M            | 0.25  | 0.15
| Gold        | E            | 0.20  | 0.20
| Gold        | M            | 0.45  | 0.35
| default     |              | 0.05  | 0.05

The example assumes 'bonus' is a discount rate and 'point_bonus' is additional points awarded to different members. 

Instead of coding how to compute the bonus based on member_tier and booking_code in rules using expressions, it can be looked up from the above lookup table.

#### getLookupValue ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the matching value for column 'value_column'.

	getLookupValue(
		'bonus_lookup', 
		[getMemberTier(), getActivityValue('booking_code')], 
		'bonus')

#### getLookupValues ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the list of matching values for column 'value_column'. Difference from *getLookupValue* is that in this case, multiple matches are possible.

	getLookupValues(
		'bonus_lookup', 
		[getMemberTier()], 
		'bonus')


#### inLookup ('match_value', 'lookup_name', array_of_keys, 'value_column')

Check if match_value is one of the values in column 'value_column' in the lookup table 'lookup_name' matching keys in the array 'array_of_keys'. 

	inLookup(
		'0.10',
		'bonus_lookup', 
		[getMemberTier()], 
		'bonus')
	//Essentially, same as
	match_value in getLookupValues (
		lookup_name, 
		array_of_keys, value_column)

#### countLookupValues ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the count of matching values for column 'value_column'.

#### sumLookupValues ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the sum of matching values for column 'value_column'.

#### maxLookupValues ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the maximum of matching values for column 'value_column'.

#### minLookupValues ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the minimum of matching values for column 'value_column'.

#### avgLookupValues ('lookup_name', array_of_keys, 'value_column')

Lookup the lookup table 'lookup_name' based on 'array_of_keys' and return the average of matching values for column 'value_column'.

## Analytics-centric Functions

A few additional functions that are used mainly in analytics queries.

#### sumHistoryItems ('attributeName', filter, 'period')
Return the sum of values for attribute 'attributeName', with activities in a given period, further filtered by a filter closure. 
The function in 'previous activities' section with the same name can only filter activity type, is a special version of this function. 


	// Total spend from purchases with spending greater than 100 dollars
	sumHistoryItems ('spend', {it.sl_type == 'purchase' && it.spend > 100}, 'ytd')
		
#### sumHistoryItems (valueClosure, filter, 'period')
This version of the 'sumHistoryItems' is even more flexible. The valueClosure is a closure that can return arbitrary values using activity 
attributes.

	// Total tax paid from purchases with spending greater than 100 dollars, assumed discountRate is a header attribute for each purchase
	sumHistoryItems ({it.spend * it.discountRate}, {it.sl_type == 'purchase' && it.spend > 100}, 'ytd')

#### groupHistoryItems ('attributeName', groupBys, filter, 'period')
Operate on all activities in a given period 'period' filtered by 'filter'. Sum up the attribute 'attributeName' group by a number of one or 
multiple, return a map of Key/Value pairs. Each element in the groupBy list can be an activity header attribute or 'activity_date', 'activity_month', 
'activity_year'.

	// Returns spending on each day in the last 3 months, as a map from Date to spending
	groupHistoryItems ('spend', ['activity_date'], {it.sl_type == 'purchase'}, 'last3m')




## Supporting Details

### <a name="period"></a> Specifying Time Periods
Time period may be specified as:

* **_MM/dd/yyyy_-_MM/dd/yyyy_**: Period between the first date and the second date

* **alltime**: all time

* **ytd**: Year to date

* **mtd**: Month to date

* **last****_\<n\>_****d**: last _n_ days; e.g. last5d
* **last****_\<n\>_****w**: last _n_ weeks; e.g. last3w

* **last****_\<n\>_****m**: last _n_ months; e.g. last2m

* **prev****_\<n\>_****d**: previous _n_ days; e.g. prev5d. The 5 days before the last 5 days. Used for period-to-period comparison.

* **prev****_\<n\>_****w**: previous _n_ weeks; e.g. prev5w. The 5 weeks before the last 5 weeks. Used for period-to-period comparison.

* **prev****_\<n\>_****d**: previous _n_ months; e.g. prev5m. The 5 months before the last 5 minths. Used for period-to-period comparison.

...

The last 5 days includes today; the last 5 months starts on 06/20/2015 if today is 11/19/2015. the last 5 weeks starts 34 (5 * 7 - 1) days ago. 
All times are 12am midnight. Date is in GMT.   

### Groovy Closures

The expressions wraped in "{}" (and using "->") are groovy closures. Among other things, closure in groovy language allows passing variables into a block of code from surrounding context. Most uses above of closures are where the rule invocation needs to inject a variable, such as item (line item) or activity when processing activities.

In summary, closure follows the syntax:
```
{closureParameters -> statements}
```

Expressions dealing with activities, inject one parameter for referencing the activity. Therefore, they are of type:
```
{activity -> activity.spend > 300}
```

Expressions dealing with activity line items, inject one parameter for referencing the line item. Therefore, they are of type:
```
{item -> item.sku == 'SKU0001'}
```

** Note: ** - For single closures, paramater and "->" can be omitted and the implicit parameter "it" may be used. However, for readability, using parameters may be preferred. For example,
```
{it.spend > 300}
```
and
```
{it.sku == 'SKU0001'}
```
are equivalent to previous 2 examples.

Please see [Groovy Closure Syntax](http://www.groovy-lang.org/closures.html).

### Useful Groovy expressions

#### Checking if item in list
```
'ca' in ['ca', 'ny', 'az']
```
