#!/bin/bash

echo "민지의 AI 프로젝트 셋업"
echo "1) React + Vite + TypeScript + Tailwind CSS 프로젝트 생성"
echo "q) 종료"
read -p "선택: " choice

if [ "$choice" == "1" ]; then
    echo "React + Vite + TypeScript + Tailwind CSS 프로젝트를 생성합니다..."
    npm create vite@latest my-vite-app -- --template react-ts
    cd my-vite-app
    npm install
    npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
    # Tailwind CSS 설정 내용 추가
    echo "module.exports = { purge: ['./index.html', './src/**/*.{js,jsx,ts,tsx}'], darkMode: false, theme: { extend: {}, }, variants: { extend: {}, }, plugins: [], }" > tailwind.config.js
    echo "@tailwind base;\n@tailwind components;\n@tailwind utilities;" > ./src/index.css
    sed -i 's/<div id="root"><\/div>/<div id="root" className="container mx-auto"><\/div>/g' ./index.html
    echo "완료되었습니다!"
else
    echo "종료합니다."
fi
