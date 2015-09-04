---
title: Challenges
layout: page
categories: ["Guides"]
---
# Challenges

Challenges are a mechanism to engage members by challenging them to perform some interesting activities.

## Challenge Types
Stellar provides many challenge types.

### Photo Challenge
Ask members to enter a photo with desired characteristics. Edit the response settings for the photo challenge under the tab *Response* when viewing the details of the specific challenge. Specify the photo resolution (original, high, medium, or low) and when to share the photo submission on the News Feed and gallery (on submission, on approval, or on manual sharing).

### Video Challenge
Ask members to enter a video with desired characteristics. Edit the response settings for the video challenge under the tab *Response* when viewing the details of the specific challenge. Specify the limit for the video size and when to share the video submission on the News Feed and gallery (on submission, on approval, or on manual sharing).

### Survey Challenge
Use to quiz or survey members. Specify the type of survey challenge under the tab *Response*. The **numeric** question type prompts the member for a numerical answer. You can set the correct answer to be any answer, a specific number, or a range of numbers. The **text** question type prompts the member for a written response. You can set the maximum number of characters allowed in the response and the criteria for a correct response, either based on content (if the response matches exactly, contains, or starts with the answer) or length of the response. The **rating** question type prompts the member to respond with a rating between 1 and 5 stars. You can set the correct response to be any answer (default), a specific value, or anywhere in a range of values. The **multiple choice** question type prompts the member to choose a response from preset options. You can set the correct response to be any answer, a specific answer, or a range of answers.

### Facebook Challenge
Ask members to enter a photo with desired characteristics and share it to Facebook.

### Generic Challenge
Use generic challenge type for custom challenge types. These challenge types provide the client rendering the challenge with a custom JSON that the client can handle.

## Challenge Incentives and Limits
### Challenge Awards
Use *challenge awards* setting to specify what should be awarded to the member for completing the challenge. Awarding happens only on approval. For auto-awarding points based on submissions, check the *auto approve* flag.  

### Challenge Limits
Use challenge limits to control the number of times and how often members are allowed to enter a challenge. Edit challenge limits on the Challenge | More Settings screen. Specify the total maximum submissions for all members, the maximum submissions for each individual member, and the minimum amount of time between submissions.

## Challenge Presentation to Members
### Display
Use the content editor in the *Display* tab to specify what the cover of the challenge should look like to the member based on the channel and presentation mode where the challenge is rendered. Refer to [content guide](./content) for details.

### Categories
Use categories to tell the client, in which member facing categories the challenge is included. Interpretation of category is specific to the client.

## Challenge Lifecyle
Use status and effectivity to manage when a challenge is in use. 

### Status
Change the **status** of a challenge to change the visibility of the challenge to members:

* *Draft:* Members cannot view the challenge. Edit the challenge on the console in *draft* mode.

* *Published:* Members can view the challenge and are eligible to enter. You are restricted from editing some characteristics of the challenge (such as *challenge type*) after members enter it.

* *Archived:* Members can no longer view the challenge and are ineligible to enter. You can still view all archived challenges on the console.

### Effectivity
Change the **effectivity** of a challenge to designate the time frame for which members can view and enter the challenge:

* *Always:* The challenge is always visible to members until manually archived.

* *Schedule:* Customize the time frame that the challenge is active. Includes the capability to have recurring challenges.



## Challenge Eligibility
Use segment or eligibility based eligibility to limit who can see and act on which challenges.
### Challenge Segments
Use the Challenge | Segments screen to specify one or more eligible segments for each challenge. Use segmentation to target a specific demographic with the challenge by including or excluding segments to be eligible for the challenge. View the Members | Segments page to create member segments.

### Challenge Locations
Use the Challenge | Locations screen to specify one or more eligible locations for each challenge. Target specific locations with individualized challenges by including or excluding locations. View the Locations page to create locations.

## Other Challenge Settings
### Tracking Code
Use Tracking Code if the challenge URL would be shared on external channels such as email or Facebook and clicks need to be tracked and associated with the challenge. The specified code gets added to the challenge URL. Note that this is not needed for tracking within Stellar apps.


## Organizing Challenges
Use tagging, aasignment, searching, filtering, sorting to organize and find challenges.

### Tags
Tags provide a flexible and easy mechanism to group challenges or just to mark them for quick searches.

### Assignee
Choose an **assignee** for a challenge in order to give ownership or responsibility for the challenge to one or more team members. You can easily find the tasks assigned to a specific person by searching for a name in the Challenge search bar.

### Searching
Search for challenges by name, label (display name), tags, or assignees.

### Filtering
Filter challenges by status and/or effectivity.

### Sorting
Sort challenges by date created, date updated, or display name.

### Challenge Categories
Use the Challenge | Settings | Challenge Categories screen to define categories to organize different types of challenges. Add challenges to a category you have created by editing the *Categories* section of a specific challenge.


## Managing Challenge Submissions

View all challenge submissions under Challenge | Challenge Responses. You can comment on any challenge submission. You can choose to change the setting of a challenge to **auto approve** to automatically approve the submissions for that challenge. A challenge response has the status **submitted** if it has not been received but neither accepted nor rejected. The status **approved** indicates that either the challenge utilizes the auto approve feature or that the submission has been manually approved. The status **rejected** indicates that the submission is ineligible to receive the challenge award. You must manually reject a submission. You can add a message to the member regarding the rejection and give him/her the opportunity to re-enter the challenge. The status **returned** indicates that the submission was rejected but the member has the opportunity to re-enter the challenge.

## Also See
* [Content](./content)