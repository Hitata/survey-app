# Survey app for a Technical Assignment
## Abstract
This survey app is a simple implementation of the Technical Assignment given as a first round for a job interview. Its for a full-stack developer position.

I'm planing to use about 4-5 hours only on this assignment. I believe in **limit scope for fast decision & add new feature later if needed**

This will showcase my experience in:
- How I approach the problem and process the requirements.
- plan out step by step what I will do.
- the proficiency of tools (docker, vuejs, rails)
- showing my work by git commits

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
    + full_name: string
- survey_answers
    + survey_result_id: foreign_key -> survey_results
    + question_id: foreign_key -> questions
    + answer_id: foreign_key -> question_options

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
- `POST /surveys/:id/answer` (need to think about request body)
- `GET /survey-results/search/:email`
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