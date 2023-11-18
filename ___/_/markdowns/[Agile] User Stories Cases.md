# Agilní vývoj softwaru

Přehled postupů jak vytvořit sofwatre podle potřeb uživatele. Jak definovat požadavky na vlastnosti a chování softwaru.  

## Produkt

# Three levels #

Personal : Organizational
---------------------------

Goals : business objectives
Tasks : business processes
Tools/Features : employees, vendors & systems

# Business Goals #

## Business Value ##

Built Software for:
    internal use:
        Save Money or
        improves customer service
        (indirectly earns money)
    use by customers, earns money through:
        direct sales,
        improved customer retention, or
        improved customer loyalty

## Product Goals ##

Product goals describe the outcomes or benefits received by the organization after the product is in use

Example:
Output: The Product ships
Outcome: customers & users act - buy, use, & give feedback
Impact: Your company, customers, & users begin to see long term benefits

## Product Metrics ##

How would we observer progress towards our goal?

“if we’re making progress towards this goal, how would we know it?  What would we observe in our organization that indicates success?”

## User Story

`User Story` Krátký *statement* který popisuje cíl, kterého chceme dosáhnout a výhody které nám poskytuje.
Obvykle existuje 1 user story per user persona. Kolem user stories se točí celá user experience. Pomáhají nám sestavit roadmap.

__Template__

  As a [user] I *want/sould be able* to [feature] because [reason].

## User Scenario

`User Scenario` popisuje jak dosáhmene cíle definovaného v `User Story`.
Popisuje konkrétně, jak uživatel dosahuje cíle definováho v user story.
User scenario pohání design. Lze jej rozdělit do jednostlichý úloh (task).
User scenario může být různé pro různé druhy uživatelů.

`User Story` může obsahovat více `User Scenarios` viz dále.

__Template__

    User Story

    Title
      {User : actor} SHOULD BE ABLE TO {save document : action}.

    Description
      As a {User} 
      I want to save a document
      Because I need it for the future work.

    Scenarios
      Given 
      When
      Then

      Given
      When
      Then

    Additional Info
      icon = bookmark icon

> Every story title should include the word “should”. NEVER use the word “can”, which camouflages desired behavior. E.g. It’s unclear whether the story “User can delete comment” is a feature or a bug. “User should be able to delete comment” or “User should not be able to delete comment” are much clearer: the former is a feature, the latter a bug. Don’t make me guess. — J. Berger

## Úkázky User Stories

The following is an example set of typical User Stories.

Story: User Registration

Scenario: [Unregistered User] should see a link to user signup
  GIVEN as an unregistered user
  WHEN I go to the main site
  THEN I should see a link to signup as a user

Scenario: [Unregistered User] should see a registration form
  GIVEN as an unregistered user
  WHEN I go click on 'signup'
  THEN I should see a form allowing me to sign up to the site

Scenario: [Unregistered User] should receive confirmation email on signup
  GIVEN as an unregistered user
  WHEN I fill out the signup form
  AND click submit
  THEN I should receive a confirmation email with a link that activates the account

Scenario: [Unregistered User] should be able to activate user account
  GIVEN as an unregistered user
  AND I have received a confirmation email
  WHEN I click on the activation link
  THEN I should have an activated account
  AND I am automatically logged in
  AND I am taken to the landing page for new users

---

As a developer, I want to refactor the BarSplat module so that it has less duplication
As a developer, I want to configure Jenkins so that we have continuous integration
As a product owner, I want to have the stories estimated so that we can make a good plan
As a tester, I want the test cases defined so I can test the system

<https://www.industriallogic.com/blog/as-a-developer-is-not-a-user-story/>

Story: As an authorized user, I want to upload a copy of my dissertation to the repository services platform so that I can manage its preservation and dissemination.

Acceptance Criteria
===================

Scenario 1: User is not authenticated
Given the user is an authorized user
And she has not yet authenticated
When she visits the URL for uploading files
Then she is challenged by a login screen
And, upon authentication, she is redirected to the upload form

Scenario 2: User is not authorized
  Given the user has successfully authenticated
  And she is not an authorized user
  When she visits a URL for uploading files
  Then she sees an error page stating clearly that she is unauthorized and provides a contact email address

Scenario 3: User gets to the form
  Given the user is an authorized user
  And she has authenticated
  When she visits the URL for uploading files
  Then she sees the upload form
  And may proceed to fill it out

Scenario 4: User submits the upload form with files attached
  Given the user is authenticated and authorized
  And she has filled out all required fields within the form, including one or more files
  When she submits the form
  Then her files are uploaded into the repository services platform
  And she is redirected to a view that confirms the success of this operation

## Storyboard

Nákres jak uživatel interaguje s programmem.

## User Persona ##

*User Persona* je archetyp, který reprezentuje uživatele. Různí uživatelé mohou mít různé schopnosti, potřeby a cíle. Naším úkolem je rozdělit a popsat uživatele do skupin, tak abychom vlastnosti a chování systému odpovídalo jejich potřebám a cílům. V nejjednodušším případě bude mít systém jeden druh uživatele. Je dobré si uživatele představit a předvídat jeho chování. Pokud své uživatele obře neznáme, musíme udělat průzkum.  

Představme si uživatelskou zkušenost (UX) jako scénář:

- typické použití včetně typických problémů
- Interesting plot points
- Goals and pains of your user

Příklad uživatelů kteří mohou pracovat se sytémem:

- *Úředník* potřebuje rychle a bez přemýšlení používat systém. Nepožaduje osobní úpravy (např. UI) nastavení systému.
- *Analytik* je schopný používat i složitější systém. Požaduje si systém (např. UI) upravit podle svých potřeb.

# User Tasks #

"Cloud level" = Too abstract
"Kite level" = Activities = long term goal with no precise ending. Perform several functional tasks in the context of an activity
"Sea Level" = Functional tasks = reasonably expect to complete in a single sitting
"Fish level" = Sub-functional tasks = Small tasks that by themselves don’t mean much.  I’ll do several of these before I reach a functional level goal.
"Ocean floor level" = too detailed

from Cockburn’s Writing Effective Use Cases

## Tasks ##

User tasks are decompose to smaller tasks and organize into activities

Tasks require intentional action on behalf of a tool’s user

Tasks have an objective that can be completed

Make ideal user stories.
Example: As a [User Role], I want to [Task], so that I can [Benefit].

## Activities ##

Have:
    Some associated tasks
    One goal or purpose
    A main participant
    Other (human) participants
    Place or location
    Tools (computers, software, electronic files, telephones, information, paper, etc)

“Read an email message” is a task, “Managing email” is an activity.

List activities over time form the "skeleton" of the system, and associated Tasks (User Stories) are listed beneath the Activities/"Epics" they fulfill.

Push higher value or more necessary stories up and lower value stories down to form "swim lanes" for each Release/Iteration of the Product.

# Product release roadmap #

# Name: purpose/mantra

# Business benefits: 1-2 sentences

# User benefit: 1-2 sentences

Example:
    EasyPOS Point of Sale Software

    Release 1: Replace the cash register

    Business: gets rid of old manual cash registers and gets accurate up to the minute sales information across locations.

    Users: Cashiers get an easier to use cash register that helps them make less mistakes, corrects them when they do, and saves time balancing cash drawers every night.

## Iteration ##

“iterating” builds a rough version, validates it, then slowly builds up quality

It's not iteration if you only do it once.

“incrementing” builds a bit at a time

Incrementing calls for a fully formed idea.
And, doing it on time requires dead accurate estimation.

## Quality ##

Objective quality = ‘conformance to requirements’
    (measurable, easily validated, perform as specified, bug-free)
Subjective quality = ‘satisfaction of users.’

    Must-haves:
        The products must have this features for me to be consider the product acceptable

    One-dimensionals:
        The more of this I get, the better

    Delighters:
        I love this element of the product!

--Noriaki Kano

Subjective criteria: Simple to use? Efficient? Likable? Fun?
Criteria tend to vary from user to user.

“This car has many flaws. Buy it anyway. It’s so much fun to drive”
-- from a NY Times review of the Mini Cooper

# Three Phases #

Opening Game: Build a simple system span of necessary features first – the walking skeleton
Example: A form with only necessary fields and no validation

Mid-Game: Add flexibility, business rule enforcement and safety next.
Example: a form with optional fields, date lookup tools, input translation on dates
Safety Examples: input validation, enforcement of business rules such as credit card validation  

End Game: Finish with comfort, performance, and luxury.
Refine the UI and interactions, take advantage of iterative learning.
Reserve time in the remaining third for unforeseen additions and adaptations
Example: auto-completion, sexy visual design, speed keys

Remember: Uncertainty decreases over time

Construx on the Cone of Uncertainty: <http://www.construx.com/Page.aspx?hid=1648>
Visdos on the cone: <http://www.implementingscrum.com/2008/02/19/vegas-hangover-enlightenment/>

## Business Value over time ##

Like art: Sketch, under-painting, and slowly build up detail over time.

Value S-Curve: Most business value gained in the Mid Game.

Opening Game
Early stories emphasize iteration and learning.  We need to be sure we’re building the right product

Mid Game
Once we’re confident we have the “shape” of the product right, we begin to pile in value

End Game
Over time the value of stories begin to diminish signaling it’s time for release

To finish on time we may “trim the tail” by deferring stories of modest value

## Guidelines for releasing on time ##

Thin stories aggressively during early sprints to build all essential functionality early.
Build up functionality only after all necessities are in place.
Protect time in the final sprints for product refinement.
Assess release readiness at the end of each sprint as part of product review.

Source: <http://www.agileproductdesign.com/presentations/user_story_mapping/index.html>
and <http://www.agileproductdesign.com/downloads/patton_user_story_mapping.ppt>

## Odkazy

<https://en.wikipedia.org/wiki/User_story>
