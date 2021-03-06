# bank-tech-test

## user stories
I decided to try to use each one of the Acceptence Criteria to create a user story; I found that since the first two relate to virtually the same thing; I could apply the DRY principle here and let the second user story reflect not the act of depositing but the other pieces of information that go along with the deposit. I also extended the scope to "transactions" so this user story can refer to withdrawals too. \
Also it became apparent that the last two lines refer to the same action; so I have four user stories.

```
As a client
So that I can store my money
I'd like to be able to deposit into my account
```
```
As a client
So that I can track my money
I'd like my transactions to have a datestamp and a record of the amount
```
```
As a client
So that I can spend some money
I'd like to be able to withdraw from my account
```
```
As a client
So that I can keep a record of my finances
I'd like to be able to print a statement with details of all my transactions
```

## minimum viable product
abbreviation: minimum viable product will be refered to as MVP
### defining the MVP
Question: What is the core functionality of this bank?

My answer: make deposits and withdrawals.

I will start working towards this as my MVP, there should be:
- some means of adding to the balance and
- some means of reducing the balance
- some means of tracking what the balance is at each step

### developing beyond the MVP
After the initial three functinalities, I will begin to add the datestamps to the transactions ann think about how to print the statement.

## project setup
The code for this project will be written in Ruby and tested using Rspec. after setting up the project directory, run the command `$ rspec --init` from the terminal.

## next steps
The MVP is complete, so the next steps will be:

- setting up a way to record what transactions have been made

actually that's it for now; after this is done, the datestamps will be  added into the `.deposit` and `.withdraw` methods, then it should be straightforward enough to add these into whatever method is recording these and subsequently it will be straightforward to create a method to print these.


### next next steps

example of how printed statement should look:
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
(from the acceptance criteria document)
