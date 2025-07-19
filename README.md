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

## Requirements

To run these workflows successfully:
- Your project should be initialized with `npm` (for the test step)
- A valid `test` script should exist in your `package.json`

---

## Future Plans

More workflow examples may be added to demonstrate:
- Manual triggers (`workflow_dispatch`)
- Scheduled runs (`cron`)
- Deployment automation

---

## Learning Focus

This project serves as a hands-on learning guide for:
- Beginners in CI/CD
- Developers exploring GitHub Actions
- Frontend developers using React with automated workflows