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

**Requirements:**

To run the test-related steps in these workflows:

- Your project should be initialized with npm
- A valid test script should exist in your package.json

> You can remove or comment out the test steps if your project doesn't use npm or doesn't include automated tests.

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

### 6. `matrix-job.yml` - Matrix Strategy Across OSs

This workflow is manually triggered using `workflow_dispatch` and utilizes a **matrix strategy** to run jobs in parallel on different operating systems (`ubuntu`, `windows`, and `macOS`).

**Inputs:**
- `environment`: Select an environment from development, staging, or production

**Jobs:**
- Runs the same steps on each OS:
  - Checks out the repository
  - Prints job, OS, actor, branch, timestamp, and commit message

This file is helpful for testing how your project behaves on different environments and platforms.

---

### 7. `deployment.yml` - SSH-Based Deployment on Push

This workflow is triggered automatically on every push to the `main` branch.

**Jobs:**
- Sets up SSH using a private key stored in GitHub Secrets
- Lists the files on the target server for verification
- Deploys `frontend/index.html` to a live server via SCP
- Creates a `deployment.log` file on the server to confirm the deployment

This setup is ideal for teams looking to implement basic CI/CD deployment pipelines to a test or production server securely over SSH.

---

## Next Plans

More workflow examples may be added to demonstrate:
- Manual triggers (`workflow_dispatch`) — **Completed**
- Scheduled runs (`cron`) — *Optional*
- Deployment automation — **Completed**
- Advanced expressions and commands — *Coming soon*

---

## Learning Focus

This project serves as a hands-on learning guide for:
- Beginners in CI/CD
- Developers exploring GitHub Actions

> While the examples are built around a simple NodeJS file, the concepts and workflows are applicable to any software project.


------
------


# أمثلة على سير عمل GitHub Actions CI/CD

يحتوي هذا المستودع على مجموعة من سير العمل البسيطة باستخدام GitHub Actions، بهدف توضيح سيناريوهات CI/CD المختلفة والتشغيل التلقائي باستخدام ملفات `.yml`.

## الهدف

الهدف من هذا المشروع هو استكشاف وتوثيق الاستخدامات الشائعة لـ GitHub Actions، مثل:

- تشغيل سير العمل عند دفع الكود أو إرسال طلب سحب
- تنفيذ المهام عند تغيير ملفات في مسارات معينة
- عرض المخرجات وتنفيذ مهام بسيطة داخل المشروع
- توضيح كيف يندمج CI/CD في تطوير الواجهات الأمامية الحديثة (مثل React)

كل سير عمل موجود في ملف YAML منفصل لسهولة الفهم والتعلم.

---

## ملفات سير العمل

### 1. `main.yml` - أول سير عمل

يتم تشغيل هذا السير عند دفع الكود إلى الفرع `main`.

**المهام:**
- طباعة رسالة ترحيبية
- جلب ملفات المستودع
- عرض جميع الملفات الموجودة في مجلد المشروع

مفيد لفهم الهيكل الأساسي لأي سير عمل باستخدام GitHub Actions.

- يعرض التفاصيل التالية حول الالتزام (`<< تحديث`):
  - اسم المستخدم الذي قام بالدفع (`github.actor`)
  - الفرع الذي تم عليه الدفع (`github.ref_name`)
  - وقت تنفيذ الالتزام (`github.event.head_commit.timestamp`)
  - رسالة الالتزام نفسها (`github.event.head_commit.message`)

يُستخدم هذا للسجلات والتحقق من عمليات الدفع، خاصة في بيئات العمل الجماعي.

---

### 2. `push-pr.yml` - مشغلات الدفع وطلبات السحب

يتم تشغيل هذا السير عند:

- أي دفع إلى الفرع `main`، ولكن **فقط إذا تم تعديل ملفات تحت المسار `src/`**
- أي طلب سحب يستهدف الفرع `main`

**المهام:**
- جلب ملفات المستودع
- تنفيذ اختبارات المشروع باستخدام `npm test`

يوضح هذا الإعداد الفرق بين الدفع المباشر وطلب السحب، وكذلك كيفية تحديد تشغيل المهام بناءً على المسارات.

**المتطلبات:**

لتنفيذ خطوات الاختبار داخل هذا السير:

- يجب أن يكون المشروع مهيأ باستخدام npm
- يجب أن يحتوي ملف `package.json` على سكربت اختبار صالح

> يمكن إزالة أو تعليق خطوات الاختبار إذا لم يكن مشروعك يستخدم npm أو لا يحتوي على اختبارات تلقائية.

---

### 3. `manual.yml` - تشغيل يدوي مع إدخال بيانات

يتم تشغيل هذا السير يدويًا باستخدام `workflow_dispatch` ويسمح لك باختيار بيئة التشغيل (مثل: التطوير، الاختبار، الإنتاج).

**المدخلات:**
- `environment`: اختيار من قائمة لتحديد البيئة التي سيتم تنفيذ المهام عليها

**المهام:**
- عرض اسم البيئة المحددة أثناء تنفيذ المهام

مفيد لمحاكاة سيناريوهات النشر بناءً على البيئة أو لإجراء فحص يدوي للجودة.

---

### 4. `jobs.yml` - تنفيذ مهام بالتتابع والتوازي

يتم تشغيل هذا السير يدويًا ويوضح كيفية التحكم في ترتيب المهام باستخدام `needs`.

**ترتيب المهام:**
- `manual-job1`: يتم تنفيذه أولاً
- `manual-job2` و `manual-job3`: يتم تنفيذهما بالتوازي بعد الانتهاء من `manual-job1`
- `manual-job4`: يتم تنفيذه بعد الانتهاء من `manual-job2` و `manual-job3`

كل مهمة تطبع اسمها وتوضح ترتيب تنفيذها.

هذا الملف مفيد لفهم تنسيق وتنظيم المهام في سير العمل المعقد.

---

### 5. `actions.yml` - استخدام أدوات GitHub الرسمية

يتم تشغيل هذا السير يدويًا ويوضح كيفية استخدام أدوات GitHub الرسمية مثل `actions/checkout`.

**المهام:**
- جلب ملفات المستودع والفرع الحالي باستخدام `actions/checkout`
- طباعة رسالة توضح اسم المستودع

يوضح هذا الملف كيفية استخدام الأدوات الجاهزة في GitHub داخل سير العمل.

---

### 6. `matrix-job.yml` - استخدام استراتيجية المصفوفة عبر أنظمة التشغيل

يتم تشغيل هذا السير يدويًا باستخدام `workflow_dispatch` ويستخدم استراتيجية **المصفوفة** لتشغيل المهام على أنظمة تشغيل مختلفة (`ubuntu`، `windows`، `macOS`) بالتوازي.

**المدخلات:**
- `environment`: تحديد البيئة (تطوير، اختبار، إنتاج)

**المهام:**
- تنفيذ نفس الخطوات على كل نظام:
  - جلب ملفات المشروع
  - طباعة اسم المهمة، نظام التشغيل، المستخدم، الفرع، وقت الالتزام، ورسالة الالتزام

هذا الملف مفيد لاختبار توافق المشروع مع أنظمة مختلفة.

---

### 7. `deployment.yml` - النشر عبر SSH عند الدفع

يتم تشغيل هذا السير تلقائيًا عند أي دفع إلى الفرع `main`.

**المهام:**
- إعداد الاتصال عبر SSH باستخدام مفتاح خاص محفوظ في أسرار GitHub
- عرض الملفات الموجودة على الخادم للتحقق
- نشر ملف `frontend/index.html` إلى الخادم باستخدام SCP
- إنشاء ملف `deployment.log` على الخادم لتأكيد نجاح النشر

هذا الإعداد مثالي للفرق التي ترغب في تنفيذ عملية نشر تلقائي بسيطة وآمنة إلى خادم اختبار أو إنتاج.

---

## الخطط القادمة

قد يتم إضافة أمثلة جديدة لسير العمل لتوضيح:
- التشغيل اليدوي (`workflow_dispatch`) — **تم**
- التشغيل المجدول (`cron`) — *اختياري*
- النشر التلقائي — **تم**
- التعبيرات والأوامر المتقدمة — *قريبًا*

---

## الهدف التعليمي

هذا المشروع يُعد دليلاً عمليًا للمبتدئين في CI/CD أو المطورين الذين يرغبون في التعرف على GitHub Actions.

> رغم أن الأمثلة تعتمد على ملف NodeJS بسيط، إلا أن المفاهيم وسير العمل قابلة للتطبيق على أي مشروع برمجي.

