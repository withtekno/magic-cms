#!/bin/bash

# Receives variables from the main script
siteTitle=$1
siteDescription=$2
author=$3
keywords=$4

# Create directories and files
echo "Creating directories and files..."
mkdir -p views/components views/pages public

# Create/Overwrite config.js with user input
cat > config.js <<EOF
module.exports = {
  siteTitle: '$siteTitle',
  siteDescription: '$siteDescription',
  author: '$author',
  keywords: '$keywords'
};
EOF

# Create EJS components and pages
cat > views/components/header.ejs <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= title %> | <%= config.siteTitle %></title>
    <meta name="description" content="<%= config.siteDescription %>">
    <meta name="author" content="<%= config.author %>">
    <meta name="keywords" content="<%= config.keywords %>">
</head>
<body>
    <header>
        <nav>
            <a href="/">Home</a>
            <a href="/about">About</a>
        </nav>
    </header>
EOF

cat > views/components/footer.ejs <<EOF
    <footer>
        <p>© 2023 $siteTitle</p>
    </footer>
</body>
</html>
EOF

cat > views/pages/index.ejs <<EOF
<%- include('../components/header', { title: 'Home' }) %>
    <main>
        <h1>Welcome to the Home Page</h1>
    </main>
<%- include('../components/footer') %>
EOF

cat > views/pages/about.ejs <<EOF
<%- include('../components/header', { title: 'About' }) %>
    <main>
        <h1>About Us</h1>
    </main>
<%- include('../components/footer') %>
EOF

cat > app.js <<EOF
const express = require('express');
const app = express();
const config = require('./config');

app.set('view engine', 'ejs');
app.use(express.static('public'));

app.use((req, res, next) => {
  res.locals.config = config;
  next();
});

app.get('/', (req, res) => res.render('pages/index'));
app.get('/about', (req, res) => res.render('pages/about'));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(\`Server is running on port \$\{PORT\}\`));
EOF

echo "Project content has been generated successfully!"
#!/bin/bash

# Receives variables from the main script
siteTitle=$1
siteDescription=$2
author=$3
keywords=$4

# Create directories and files
echo "Creating directories and files..."
mkdir -p views/components views/pages public

# Create/Overwrite config.js with user input
cat > config.js <<EOF
module.exports = {
  siteTitle: '$siteTitle',
  siteDescription: '$siteDescription',
  author: '$author',
  keywords: '$keywords'
};
EOF

# Create EJS components and pages
cat > views/components/header.ejs <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= title %> | <%= config.siteTitle %></title>
    <meta name="description" content="<%= config.siteDescription %>">
    <meta name="author" content="<%= config.author %>">
    <meta name="keywords" content="<%= config.keywords %>">
</head>
<body>
    <header>
        <nav>
            <a href="/">Home</a>
            <a href="/about">About</a>
        </nav>
    </header>
EOF

cat > views/components/footer.ejs <<EOF
    <footer>
        <p>© 2023 $siteTitle</p>
    </footer>
</body>
</html>
EOF

cat > views/pages/index.ejs <<EOF
<%- include('../components/header', { title: 'Home' }) %>
    <main>
        <h1>Welcome to the Home Page</h1>
    </main>
<%- include('../components/footer') %>
EOF

cat > views/pages/about.ejs <<EOF
<%- include('../components/header', { title: 'About' }) %>
    <main>
        <h1>About Us</h1>
    </main>
<%- include('../components/footer') %>
EOF

cat > app.js <<EOF
const express = require('express');
const app = express();
const config = require('./config');

app.set('view engine', 'ejs');
app.use(express.static('public'));

app.use((req, res, next) => {
  res.locals.config = config;
  next();
});

app.get('/', (req, res) => res.render('pages/index'));
app.get('/about', (req, res) => res.render('pages/about'));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(\`Server is running on port \$\{PORT\}\`));
EOF

echo "Project content has been generated successfully!"
