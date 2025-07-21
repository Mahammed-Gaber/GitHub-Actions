# GitHub Actions CI/CD Workflows Examples

This repository contains a collection of simple GitHub Actions workflows designed to demonstrate various CI/CD triggers and automation scenarios using `.yml` files.

## Purpose

The goal of this project is to explore and document common GitHub Actions use cases, such as:

- Running workflows on code push or pull requests
- Triggering jobs based on specific file path changes
- Displaying output and performing basic project tasks
- Demonstrating how CI/CD fits into modern frontend (e.g., React) development

Each workflow is separated into its own YAML file for clarity and learning purposes.

---

## Workflow Files

### 1. `main.yml` - First Workflow

This workflow is triggered when code is pushed to the `main` branch.

**Jobs:**
- Prints a welcome message
- Checks out the repository
- Lists all files in the project directory

Useful for understanding the basic structure of a GitHub Actions workflow.

- Prints the following details about the commit (`<< Update`):
  - The username of the person who made the push (`github.actor`)
  - The branch the push was made to (`github.ref_name`)
  - The timestamp of the commit (`github.event.head_commit.timestamp`)
  - The commit message itself (`github.event.head_commit.message`)

This is useful for logging and auditing code pushes, especially in team environments.

---

### 2. `push-pr.yml` - Webhook Triggers

This workflow is triggered by:
- Any push to the `main` branch, but **only if files under `src/` change**
- Any pull request targeting the `main` branch

**Jobs:**
- Checks out the repository
- Runs project tests using `npm test`

This setup demonstrates conditional triggering based on paths and the difference between push vs. pull request events.

---

### 3. `manual.yml` - Manual Trigger with Inputs

This workflow is triggered manually using `workflow_dispatch` and allows you to select an environment (e.g., development, staging, production).

**Inputs:**
- `environment`: A dropdown choice to specify the environment to run the workflow against

**Jobs:**
- Displays the selected environment as part of the job step

This is useful for simulating environment-based deployment scenarios or manual QA checks.

---

### 4. `jobs.yml` - Sequential and Parallel Jobs

This workflow is triggered manually and demonstrates how to control job dependencies using `needs`.

**Job Structure:**
- `manual-job1`: Runs first
- `manual-job2` and `manual-job3`: Run in parallel after `manual-job1` finishes
- `manual-job4`: Runs after both `manual-job2` and `manual-job3`

Each job prints its name and indicates the order it was executed in.

This file is ideal for learning about job orchestration in complex workflows.

---

### 5. `actions.yml` - Using Built-In GitHub Actions

This workflow is triggered manually and showcases the use of an official GitHub Action (`actions/checkout`).

**Jobs:**
- Checks out the current repository and branch using `actions/checkout`
- Prints a message showing the repository name

This file demonstrates how to use built-in reusable actions in your workflows.

---

## Requirements

To run these workflows successfully:
- Your project should be initialized with `npm` (for the test step)
- A valid `test` script should exist in your `package.json`

---

## Next Plans

More workflow examples may be added to demonstrate:
- Manual triggers (`workflow_dispatch`) — **Completed**
- Scheduled runs (`cron`) — *Optional*
- Deployment automation — *Coming soon*

---

## Learning Focus

This project serves as a hands-on learning guide for:
- Beginners in CI/CD
- Developers exploring GitHub Actions

> While the examples are built around a simple NodeJS file, the concepts and workflows are applicable to any software project.