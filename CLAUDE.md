# Claude Code Workflow

## Workflow

When a user assigns a task, follow this process:

### 1. Clarify Requirements

If the user's instructions are not clear and specific, ask about the following before writing the Tech Spec:

- Purpose and background of the task
- Specific requirements and constraints
- Expected deliverables
- Scope and priorities
- Technical requirements

### 2. Write Tech Spec

After clarifying requirements, write a Tech Spec as a separate Markdown file (e.g., `SPEC.md` or `tech-spec-[feature-name].md`).

**IMPORTANT: The Tech Spec MUST be written in Korean.**

The Tech Spec should include:

#### Background
- Why is this task necessary?
- What is the current situation and what problems exist?

#### Goal
- What will be achieved?
- What are the success criteria?

#### Non-Goal
- What should not be done?
- What is out of scope for this task?

#### Proposed Changes
- Specific changes to be made
- Modifications per file
- Implementation approach

### 3. Get User Approval on Tech Spec

**IMPORTANT: Do NOT proceed to implementation without user approval of the Tech Spec.**

After writing the Tech Spec markdown file:

1. **Present the Tech Spec**
   - Inform the user that the Tech Spec has been created
   - Provide the file path to the Tech Spec markdown file
   - Clearly indicate that this is a proposed specification awaiting approval

2. **Request Feedback**
   - Explicitly ask the user to review the Tech Spec file
   - Request approval or revision requests
   - Wait for user response before proceeding

3. **Iterate Based on Feedback**
   - If the user requests changes, update the Tech Spec file accordingly
   - Re-present the updated spec for approval
   - Repeat until the user gives final approval

4. **Proceed Only After Approval**
   - Only after receiving explicit user approval, move to the next step (Write TODO Markdown)
   - Do NOT start writing code or creating TODO lists without approval

### 4. Write TODO Markdown

Based on the Tech Spec, create a concrete execution plan in a TODO Markdown document. This document should include:

- Detailed list of execution tasks
- Priority and order for each task
- Specific work content for each task
- Dependencies between tasks

### 5. Execute and Verify Tasks

For each task, perform the following verification process:

1. **Use Context7 MCP**
   - ALWAYS use Context7 MCP when writing or modifying code
   - Context7 MCP provides enhanced code context and understanding capabilities
   - This ensures better code quality and consistency across the codebase

2. **Leverage Specialized Sub-Agents**
   - Actively use specialized sub-agents appropriate for the task type
   - Sub-agents provide domain-specific expertise and optimized tooling
   - Examples of when to use specific agents:
     - `frontend-developer`: React components, UI implementation, responsive design
     - `typescript-pro`: Complex TypeScript types, type system optimization
     - `test-engineer`: Test strategy, test automation, coverage analysis
     - `debugger`: Investigating errors, analyzing stack traces
     - `nextjs-architecture-expert`: Next.js best practices, App Router, Server Components
     - `seo-analyzer`: SEO optimization, meta tags, performance
     - `documentation-expert`: Writing/updating documentation, API docs
   - Use multiple agents in parallel when appropriate to maximize efficiency

3. **Check Project Configuration**
   - Verify formatter configuration (e.g., Prettier, Black, etc.)
   - Verify linter configuration (e.g., ESLint, Pylint, etc.)
   - Verify type checker configuration (e.g., TypeScript, mypy, etc.)

4. **Run Verification Commands**
   - Execute commands for the validation tools configured in the project
   - Task is considered complete only when all verifications pass

5. **If Verification Fails**
   - Fix the errors that occurred
   - Re-run verification commands to confirm they pass

### 6. Code Review and Feedback Integration

After completing formatting, linting, and type checking, proceed with the following process:

1. **Code Review via Sub-Agent**
   - Execute the code-reviewer agent to review the written code
   - Review from the perspectives of code quality, security, and maintainability

2. **Integrate Feedback**
   - Analyze feedback from the code review
   - Fix areas that need improvement
   - Perform verification process (Step 4) again after fixes

3. **Final Confirmation**
   - Verify that all feedback has been integrated
   - Request additional review if necessary
