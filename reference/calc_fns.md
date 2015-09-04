---
title: Calculation Functions
layout: page
---
# Calculation Functions

## Member

These functions get information about the current member.


#### getMemberValue ('attribute_name')

Returns the value of 'attribute_name' for member. 
	
	getMemberValue('state') == 'CA'

#### getMemberTier ()
	
Returns the name of member's current tier

#### isMemberTier ('tier_name')
	
Checks if member's tier name matches 'tier_name' parameter.

#### isMemberSegment ('segment_name')

Checks if member belongs to segment 'segment_name'.

### Member Metrics

#### getMemberMetric ('metric_name')

Returns the current *life time earned* value for metric 'metric_name'.

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

#### getFilteredMetric ('metric_name', 'period', filter)

Same as [getMemberMetric](#metric) but computes the earned value of the metric from only activities matching the groovy expression specified in filter.  
	
	//get year=to-date eaned value for metric point including only earnings from activities with spend > 300
	getFilteredMetric("point", 'ytd',
		{activity->activity.spend > 300})

## Activity

These calculation functions get information for the current activity

3. TBD

## History

## Supporting details for calculation functions

### <a name="period"></a> Specifying Time Periods
Time period may be specified as:

* **_mm/dd/yyyy_-_mm/dd/yyyy_**: Period between the first date and the second date

* **ytd**: Year to date

* **mtd**: Month to date

* **last****_\<n\>_****d**: last _n_ days; e.g. last5d

* **last****_\<n\>_****w**: last _n_ weeks; e.g. last3w

* **last****_\<n\>_****m**: last _n_ months; e.g. last2m

...
