[![Build Status](https://travis-ci.org/viniciusd/bank-account-opening.svg?branch=master)](https://travis-ci.org/viniciusd/bank-account-opening)
# 🏦 bank-account-opening
> * A quick demo of an HTTP API for creating bank accounts*

## Background
We are assuming that a bank account might be created in multiple steps instead of a one-shot creation.

Therefore, multiple requests might be shot before an account moves from pending to complete.

As input, we are considering:
* `name`
* `email`
* `cpf` (Person's national identification)
* `birth_date`
* `gender`
* `city`
* `state`
* `country`
* `referral_code` (Optional if referred from an existing client)

A potential client shoots a request with some or all data needed. The system validates its input, and cryptographs `name`, `email`, `cpf` and `birth_date` if they are available. The account is then upserted, i.e., it will either be created if it doesn't exists or updated if it already exists.

When all data is present, the account is tagged as complete. Therefore, it will return a referral code for creating other accounts.

## Routes

Two HTTP endpoint are provided in order to both create accounts and check referrals.

> A new account!

### `PATCH /account`

Allows creating an account for a given person

Data is expected as a JSON body.

| Body parameter  | Type   | Values               |
| --------------- |--------|----------------------|
| `name`          | string | any                  |
| `email`         | string | a valid email address|
| `cpf`           | string | a valid cpf          |
| `birth_date`    | date   | any                  |
| `gender`        | string | male/female/other    |
| `city`          | string | any                  |
| `state`         | string | any                  |
| `country`       | string | any                  |
| `referral_code` | string | any                  |

> Who have I referred?

### `GET /referral-code/:code`

Returns a JSON-formatted list of the accounts created from a given referral code.

```json
```

## Installing and running

### 🐳 Using Docker
Plain and simple: Given the entire build process is described in the Dockerfile and in a docker-compose yaml, all it takes is cloning this repo, building, and running its image

```bash
$ docker-compose up
```
Or you can use `docker-compose` instead:
```bash
$ git clone https://github.com/viniciusd/bank-account-opening.git
$ cd bank-account-opening
$ docker-compose up
$ curl .... "
```

### 📜 Without Docker

Even without Docker, the process isn't quite complicated:
```bash
$ git clone https://github.com/viniciusd/bank-account-opening.git
$ cd bank-account-opening
$ mix phx.server
$ curl .... "
```

## Running the tests

That's gonna be even simpler!

Considering you have already cloned this repo...

### ⚗️ Elixir tests
```bash
$ mix test
```

## Decisions and assumptions
* An upsert endpoint isn't quite rest-compliant, given there are different verbs for creating entities and for updating entities. Therefore I just picked `PATCH` as requests may provide only partial data.
