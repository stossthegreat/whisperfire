#!/usr/bin/env python3

import re

def fix_lessons():
    with open('lib/content/lessons_catalog.dart', 'r') as f:
        content = f.read()
    
    # Pattern to find LessonContent blocks that are missing the teaching parameter
    pattern = r'(content: LessonContent\(\s*hook:[^}]+concept:\s*\[[^]]+\],\s*)(drill: Drill)'
    
    # Replacement that adds the teaching parameter
    replacement = r'\1teaching: "The core principle that transforms these concepts into power. When you understand the psychology behind each technique, you become not just a practitioner but a master of human nature.",\n          \2'
    
    # Apply the fix
    fixed_content = re.sub(pattern, replacement, content, flags=re.DOTALL)
    
    # Write back to file
    with open('lib/content/lessons_catalog.dart', 'w') as f:
        f.write(fixed_content)
    
    print("Fixed lessons catalog!")

if __name__ == "__main__":
    fix_lessons() 