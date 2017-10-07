# Multi-Credit Card Challenge README

This project is a challenge to manage buys using many credit cards.

## Challenge

You just created your first bank account and became very happy to have your first credit card. However, you soon got uncomfortable with the bank choosing how much it thinks you can spend on that card for the month: your credit limit.

Soon you imagined that you could open accounts at other banks to have other credit cards and thus raise your credit limit.

As you are a person who is always thinking about making your life easier, you realized that this amount of cards in your wallet was a waste of space.

In addition to the burden of keeping all of them, you noticed that each card has a monthly due date for you to pay what you have spent on credit in the last month.

For example, a card has to be paid on every day 03 of the month and another on every day 15. An important detail is that you can pay the card before the due date to release more credit.
You'd rather use the card that's farther in the month to pay because you'll have more time to get rid of its bill.

If both cards expire on the same day, you would prefer to use the one that has the smallest limit to continue having the card with the highest limit.

Remember that every purchase is made just on one card. Thus, keeping a card with a higher limit gives you the freedom to make big purchases.

Only in cases where it is not possible to purchase on a single card, the system must divide the purchase into more cards.

For this, you will use the cards to complete a payment considering the same priority orders already described. That is, you spend first on the card that has the farthest due date and "complete" it with the card whose the due date is the next shorter one.

If the cards expire on the same day, you pay first with the one of lowest limit and "complete" with the next one which has more limit.

Commenting with your friends, you realized that it was not just you who have been in this kind of situation. Soon, came the brilliant idea of creating a company that concentrates all credit cards of a person and optimizes his/her purchases using the best card available for that purchase.

Now, the person will only have one card (your wallet) and she will not have to worry about these details in her day to day life.

She can define what credit limit she wants her wallet to have, respecting that it cannot be greater than the sum of the limits of all her credit cards. The best card should be chosen based on the due date of the card, and the available limit of each card, in this order of priority.

**MANAGE A WALLET**
The wallet is an entity which represents your product. The cards are stored in it.

**PREMISES OF A WALLET**
* A wallet can have many cards (the reason for all of this)
* A wallet can only belong to a user
* The maximum limit of a wallet must be the sum of all its cards
* The user can set the real limit of a wallet, but can’t surpass the maximum limit
* Having the capacity of adding or removing a card at any time
* The user must be able to access all the information of his/her wallet at any time (limit set by the user, maximum limit and available credit)
* Execute the purchase of a certain amount according to the priorities explained above.

**MANAGE A CREDIT CARD**
The card is an entity that represents the credit card.

**PREMISES OF A CARD**
Have the necessary properties to execute a purchase (number, due date, expiration date, cvv and limit).
If capable of releasing credit (pay a certain amount on the cards' account)

## Ruby version

2.4.2

## Database creation

Run: `rails db:create`

## Database initialization

Run: `rails db:migrate`

## How to run the test suite

Run: `rspec spec/`
