# DockerNet

<p align="center">
  <img width="256" height="256" src="./assets/ship-wheel-blue.png">
</p>

<p align="center">
  An easy-to-use, locally-hosted web app for developers and engineers to visualize and manage their Docker Networks in real-time.
</p>

<p align="center">
  <img alt="TypeScript" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/typescript/typescript.png" />
  <img alt="HTML5" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/html/html.png" />
  <img alt="CSS3" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/css/css.png" />
  <img alt="Sass" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/sass/sass.png" />
  <img alt="Node.js" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/nodejs/nodejs.png" />
  <img alt="React" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/react/react.png" />
  <img alt="Docker" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/docker/docker.png" />
  <img alt="Express" width="26px" src="https://raw.githubusercontent.com/github/explore/80688e429a7d4ef2fca1e82350fe8e3517d3494d/topics/express/express.png" />
</p>

## About

DockerNet provides developers with tools to visualize and manage Docker Networks. It offers both list and graphical views of networks, allowing users to create, delete networks, and manage container connections.

### Features
- Visualize Docker Networks in list and graph views
- Create and delete Docker Networks
- Add/Remove containers to/from networks
- Real-time updates

### Tech Stack
- **Frontend**: React, TypeScript, SASS, D3
- **Backend**: Node.js, Express, TypeScript
- **Build Tools**: Webpack, Babel, ESLint
- **Containerization**: Docker, Docker Compose

## Deployment

This application is containerized for production deployment using Docker Compose.

### Prerequisites
- Docker and Docker Compose installed
- Access to Docker daemon (socket mounted)

### Production Deployment
1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd dockernet-deployment
   ```

2. Set the Docker host (if using Colima or custom socket):
   ```bash
   export DOCKER_HOST=unix:///path/to/docker.sock
   ```

3. Deploy using Docker Compose:
   ```bash
   docker-compose up --build -d
   ```

4. Access the application at `http://localhost:8081`

The setup includes:
- **Frontend**: Served by Nginx on port 8081
- **Backend**: Node.js API on port 3031
- Multi-stage builds for optimized images
- Non-root user for security
- Socket mounting for Docker API access

### Local Development
1. Install dependencies: `npm install`
2. Copy `.env.example` to `.env`
3. Start development server: `npm start`
4. Open `http://localhost:8081`

### Requirements
- Node.js 20+
- Docker
- npm

## CI/CD Pipeline with Caching

For faster builds, use a CI/CD pipeline with caching. Example GitHub Actions workflow:

```yaml
name: Build and Deploy

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/cache@v2
        with:
          path: ~/.npm
          key: ${{ runner.os }}-node-${{ hashFiles('**/package-lock.json') }}
      - run: npm ci
      - run: npm run build
      - run: docker build -t dockernet .
```

## License

Distributed under the MIT License. See `LICENSE` for more information.
