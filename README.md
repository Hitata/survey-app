# Survey app for a Technical Assignment
## Submission
Thanks for taking the time to review this technical assignment. I'd like to inform reviewers that **I have only finish the Rails API** and **had not finish Vue frontend** due to deadline.

## Abstract
This survey app is a simple implementation of the Technical Assignment given as a first round for a job interview. Its for a full-stack developer position.

I'm planing to use about 4-5 hours only on this assignment. I believe in **limit scope for fast decision & add new feature later if needed**

This will showcase my experience in:
- How I approach the problem and process the requirements.
- plan out step by step what I will do.
- the proficiency of tools (docker, vuejs, rails)
- showing my work by git commits

## Setup
1. Runing backend (Rails API & Postgre)
```
docker-composer up -d
```
API is at `localhost:3000`

2. Runing frontend
```
yarn install
yarn serve
```
frontend is at `localhost:8080`

## TODO
- [x] Publisher authentication
- [x] all Rails API endpoint
- [ ] using new Vue 3 with composable api
- [ ] Vue app authentication for publisher 
- [ ] rspec request tests
- [ ] Setting up Vue to run in docker-composer

## Dificulties
- Limited time (10-15 hours spend only)
- Not having a smooth development with alot of configuration needed
- Try to use Vue 3 (with composition API)
- Not used to tailwindcss yet (seems quick easy if know)    

## User stories
### Actor: Survey Publisher (SP)
- As a SP, I'm able to signup for using this system
- As a SP, I'm able to signin for using this system
- As a SP, I'm able to CRUD a survey with 1 title and mutiple questions
- As a SP, I'm able to activate/deactivate a survey

### Actor: User
- As a User, I'm able to see the activated survey list in the homepage
- As a User, I'm able to see a survey detail page with it's questions
- As a User, I'm able to fill in my answer to the survey's questions by selecting one choice out of each question's options.
- As a User, I'm able to submit the survey answer with my email and name.
- As a User, I'm able to see my survey answers by inputing my email

## Architecture
- Backend: Rails with PostgreSQL
    + use docker-compose to have a runing api + db
    + use devise, devise_token_auth for Publisher authentication
- Frontend: VueJS, Tailwindcss
    + use normal `yarn serve` to develop frontend
    + add docker-compose later for easier show case. 

## Database
### Tables
- publisher
    + using devise, devise_token_auth generated schema
- surveys
    + id: auto_increment
    + publisher_id: foreign_key -> publisher
    + title: string
    + active: boolean
- questions
    + id: auto_increment
    + survey_id: foreign_key -> survey
    + options: string, array: true
    + title: string
- survey_results
    + survey_id: foreign_key -> surveys
    + email: string
- survey_answers
    + survey_result_id: foreign_key -> survey_results
    + question_id: foreign_key -> questions
    + answer

## API Endpoints
### Publisher
- `GET /publishers/surveys`
- `POST /publishers/surveys`
- `PATCH /publishers/surveys/:id`
- `DELETE /publishers/surveys/:id`
- `POST /publishers/surveys/:id/questions { title: 'Question 1', options: ['Q1: Option 1', 'Q1: Option 2'] } `
- `PATCH /publishers/surveys/:id/questions/:qid`
- `DELETE /publishers/surveys/:id/questions/:qid`

### User
- `GET /surveys`
- `GET /surveys/:id`
- `POST /surveys/:id/answer`
- `GET /survey-results?email='example@example.com'`
- `GET /survey-results/:id`

## Steps
1. Write User stories to understand the requirements and limit scope of development (15min)
2. Write Database schema to satisfy the current scope and not over think relations (20min)
3. Run `rails new survey-app --api` to initialize API. (10min)
4. Setup backend and db with docker-composer (10min)
5. Write some API endpoints (10min)
6. Add some migration for survey & API test code for GET survery api (40min)
7. Add authentication for publishers using `devise_token_auth`
8. Add rubocop
9. Create table question & rspec model testcases
10. Remove rspec request and add db:seed (Writing test took too much time T__T)
11. Continue add api like `API Endpoints`
11. Finish all api endpoint needed
12. create new vue with tailwind `vue create survey-app`