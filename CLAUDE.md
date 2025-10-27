## CORE PHILOSOPHY

**Clarity & Simplicity First**: Write clear, simple code. Avoid clever abstractions. Follow YAGNI (You Aren't Gonna Need It) and KISS (Keep It Simple Stupid) principles religiously.

**Iterative Development**: Build MVPs first. Add complexity only when explicitly requested. Avoid premature optimization.

**Always Ask**: If requirements are ambiguous, ask clarifying questions before implementing.

---

## WORKFLOW

### 1. Before Coding
- **Review project documentation** (specs, todos, changelog) to understand current state
- **Ask clarifying questions** if feature requirements are unclear
- **Plan the simplest approach** that solves the problem

### 2. During Implementation
- **Use modern, popular libraries** for common tasks instead of writing from scratch
- **Frontend API calls**: Only call backend routes that exist. If missing, implement backend first
- **LLM calls**: Always server-side unless explicitly stated otherwise
- **Update documentation** as you add features to reflect the current codebase state

### 3. After Changes
- **Verify UI functionality**: Use a browser MCP (if available) to inspect UI after frontend/API changes
- **Check app behavior**: Ensure proper functionality, design quality, and visual appearance

---

## MCP TOOLS

- **context7**: Fetch latest documentation
- **playwright**: Inspect UI after frontend/API changes to verify functionality, design, and appearance
- **ast-grep (sg)**: Use for precise code location searches (more efficient than grep/rg for specific code patterns)

---

## DEPENDENCY MANAGEMENT

- **Python**: Use `uv` or `rye`
- **Tailwind + Shadcn + Vite**: Follow https://ui.shadcn.com/docs/installation/vite

---

## FRAMEWORK-SPECIFIC

### Love2D
Always run in debug mode with output piping to catch errors:
```bash
love . > output.txt 2>&1
```
Fix any errors found in logs before proceeding.

---

## CODE ORGANIZATION

### Directory Structure
```
/src
  /components        # Reusable UI component library only
  /features          # Feature-based organization
    /auth           # Authentication feature
    /inventory      # Inventory feature  
    /core           # Core functionality
    /<feature-name> # One folder per product feature
```

### Feature Folders
Each feature folder contains:
- Components specific to that feature
- Hooks
- Types
- Constants
- Contexts

**Rule**: Group all code by product feature, not by technical type.

---

## COMPONENT GUIDELINES

### React
- **Break down into small, composable components and hooks**
- **Reuse existing components**: Check `/src/components/ui/*` before creating new ones
- **Split large components** into smaller, focused ones

### Component Principles
- One responsibility per component
- Compose small pieces into larger functionality
- Prefer composition over complexity

---

## CODE STYLE

### General Principles
1. **Clear > Clever**: Prioritize readability
2. **Small functions**: Each does one thing well
3. **Shallow state**: Avoid deep nesting; use flat, easily modifiable data structures
4. **Strong typing**: Create custom types as needed for clarity and safety

### Data Structures
- Keep state flat and easily modifiable
- Use appropriate data types (Maps, Sets, Arrays) based on access patterns
- Define custom types when domain concepts need clarity

### Functions
- Keep short and focused
- Single responsibility
- Clear naming that describes purpose

---

## QUALITY CHECKLIST

Before considering work complete:
- [ ] Code follows simplest possible approach
- [ ] Documentation updated to reflect changes
- [ ] UI verified with browser MCP (if available + if frontend changes)
- [ ] Backend routes exist for all frontend API calls
- [ ] Existing component library utilized where possible
- [ ] Code organized by feature, not technical type
- [ ] Components are small and composable
- [ ] State structures are shallow and easily modified
