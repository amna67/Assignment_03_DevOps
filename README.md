Overview
This project is a static University Digital Notice Board website built collaboratively using Git/GitHub, GitHub actions and containerized with Docker. The site is built with Parcel, deployed into an Nginx container via a multi-stage Dockerfile and Docker image in CI pipelines. The project enforce HTML and CSS quality using HTMLHint and Stylelint.
Setup Instructions
Clone the repository
cd uni-notice-board
Install Node.js dependencies
Make sure you have Node.js installed. Then run:

npm install
Lint HTML files in your code
npx htmlhint "**/*.html"
Lint CSS files on your code
npx stylelint "**/*.css"
Build your code
npx parcel build "./src/index.html" --dist-dir "./dist" --public-url "./" --no-cache
CI trigger test