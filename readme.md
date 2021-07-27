# Back End Engineering Tech Challenge

There are two pieces to this challenge:

1. A refactoring exercise (in the `refactoring` directory)
1. A Rails exercise (in the nearest-fuel-station directory)

Additional details on each are included below.

We recommend spending **no more than 3 hours** on this challenge.

In order to complete these challenges, clone (don't fork) this repository. Make your changes and commits in your cloned repository.

## Refactoring

The `refactoring` directory includes a working CreditCard class that is able to determine whether or not a credit card number is valid using the [Luhn Algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm). There are tests included in that directory to confirm this. In order to run those tests,

1. `cd` into the `refactoring` directory.
1. `bundle install`
1. `rspec`

There is one failing test that uses [Reek](https://github.com/troessner/reek) as a measure of the quality of the code in the CreditCard class.

Refactor the code to make that test pass, then make an update to this document to answer the questions below in this document.

* It's not uncommon that a student just learning Ruby would feel comfortable with the code as it was initially provided. Is the code that you created to make the Reek test pass better than the previous version? Why or why not? How would you describe the advantages/disadvantages of your refactored code to a student who is still fairly new to Ruby?


>I believe my refactored code is better than the previous version because it uses helper methods which exhibit abstraction, SRP, DRY code.

>The advantages to the refactored code are that the code is more readable and efficient because it uses short helper methods that follow the single-responsibility principle. In addition, each method is semantically named, which makes it easier for the successive programmer, or any reader, to understand. For example, the convert_indices_to_integers method is just four lines long, it has one job, which is to turn all of the indices (which are strings) into integers, and the name explicitly states what it is doing. These helper methods also make the code more reusable because if you decide to add features down the road that require similar logic, then you've already got these methods built, and it should be easy to implement on the new features.


>I think the main disadvantage of the refactored code is that the file is almost twice as long. We started with 33 lines of code and now have 57. This can be troublesome if you have many files that you're working with, as having to scroll more through each file can slow the developer down. It can also, potentially, be more difficult to keep track of everything in the project if the amount of helper methods gets out of hand, but that would still be preferable over longer and less efficient methods.


* Is there anything you would change if you weren't using Reek as a way to judge code quality?


>I think if I were to refactor the initial code without using Reek my solution would be similar, but I think I would have used one or two less helper methods. There are a few methods that could be combined into slightly longer helper methods that have similar functionality. For example, the convert_indices_to_integers method could easily be replaced by adding a 'to_i' to the end of both num variables in the doubled_array method, but Reek didn't like that because we were calling duplicate methods. Although, I'm not convinced that making the two 'to_i' calls would make our program any less efficient, which is why I would have combined those two.

>Overall, I think the way Reek judged the code quality is great for students that are new to Ruby because it breaks down the code into the most readable and efficient version that it can, which makes the concepts much easier to learn. On the other hand, I think students that are new to linters can sometimes worry too much about about convention preferences and spend less time on a workable solution, so I think that using Reek as a chance to refactor, as done in this lesson, would be the best use for new students.


## Rails API Consumption

The `nearest-fuel-station` directory includes a Rails app with some starter code and a single passing test.

This challenge will use information from the National Renewable Energy Laboratory. Sign up for an API key [here](https://developer.nrel.gov/signup/). If you have any trouble obtaining an API key, please let us know.

Once you have your API key, update the application based on the user story below using the API endpoint documented [here](https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/#station-count-record-fields).


As a user
When I visit "/"
And I select "Turing" from the start location drop down (Note: Use the existing search form)
And I click "Find Nearest Electric Station"
Then I should be on page "/search"
And I should see a count of Electric Stations within 5 miles of my location.
And I should see details about the five closest electric fuel stations to Turing, including their:

- Name
- Address
- Fuel Type
- Access Times


Once you've finished, answer the questions below in this document.

* At a high level, how did you organize the code that you added? For example, if you added a class or classes, what responsibilities do they have? Are there alternatives you considered or could envision? If so, why did you choose this path instead?


>I added three new classes to this project: A SearchFacade, FuelService, and FuelStation class. The SearchFacade takes a location argument that gets passed down from the controller. This facade will call on the FuelService to make an API call and return the response back to the facade. The facade will then organize this data and return two pieces of data to the controller. The first piece of data is the total count of all electric stations within 5 miles of our searched location. The facade then takes the first five responses from the service and creates five POROs. The five POROs are the other piece of data sent to the controller and they are sent as an Array so that they can be easily iterated through in the view. The main reasons for making these FuelStation objects is because the goal of object-oriented programming is to work with objects and not raw JSON.

>While at Turing, I learned to use a facade and service design pattern when working with APIs in Rails. After completing a hefty amount of projects with this design pattern, I decided not to stray away from what I'm comfortable with and what I know best. I'm aware that there are many many different design patterns, and many that I would love to explore, but for this challenge I chose the path that I knew best.


* This is sometimes used as a mid-mod assessment for students in Module 3. In Module 2 students spend a lot of time memorizing the basic rules and conventions of Rails, but in Module 3 we ask them to be more creative in their problem solving and create the classes they need to organize their code (even if it's not a model, view, or a controller). Sometimes students struggle with this change, and try to memorize any patterns instructors provide when going over a challenge like this. What strategies would you recommend to help students understand that there are many different approaches they could take to solve this problem?


>One strategy I would want to teach students would be to ask themselves many questions relating to all new content they've learned. More specifically, what do these new classes do and why does it make sense to use them? As stated in the question, far too often do students try to memorize patterns and, in my experience, far too often do students fall short of their goals because they don't have the understanding needed to organize their code successfully. Due to this lack of understanding, students believe they need to follow the exact approach their instructors used.

>It's hard to fault students, though, for following the approaches of their instructors, especially when many of them are seeing these concepts and designs for the very first time.  An additional strategy I would love to implement would be to constantly and explicitly remind students that there ARE many different ways to solve the problems that they'll face in their programming careers. In addition, having students go back and refactor their code as part of their assignments and projects will not only force them to try different approaches, but will also make them more comfortable when needing to change their approaches in future projects. It's much more important to be able to understand and defend your approaches than it is to use the 'best' strategy that your instructor gave you, especially if you don't understand it.


* We frequently ask students to focus on their problem solving *process* in lieu of the *outcome* of a timed challenge. At a high level, how would you describe your process to this challenge to a group of students who might not yet be very good at talking about how they go about solving a problem? What strategies could you use to help students begin to articulate their own approach to technical problems?


>I would describe my high-level problem solving process to students as follows. I begin to solve my problem by thoroughly reading all of the user stories so that I can determine what I want my finished product to look like. I then start to create tests the reflect what I'm imagining my 'dream scenario' of the project will be. For example, thinking about what I want to happen when I click a button on a webpage and what I want the next webpage to render. Once I have a concrete idea of what that should look like, I begin to make matching tests. After that is when I start to build out the code using MVC principles. Build the model (the PORO in my project), then the View, the Controller, and any other classes that your controller may call upon. Remember that it's okay if you don't have perfect tests at the start. The tests will drive your process through the project, but as you're working you may come up with other ideas or even completely other approaches. This is why I believe using TDD is such a great strategy since it forces you to make goals of what your projects will look like, and you will almost always meet or even exceed those expectations on all projects.

>In order to help students articulate their own approach to technical challenges, I would first show them how I would approach any technical problem, talking through my thought process along the way. This would be my approach during a lecture. When working with students in small groups or individually, my approach would be to have them explain their thought processes to me, have them write their ideas down or even psuedocode (something I would personally like to improve on) and ask them leading questions that will direct them towards productive struggle.




## Submission

In order to submit, zip this directory and then send via email to ellenmary@turing.edu, and alex@turing.edu.
