# Dynamic Image Resizer

It is a drop-in replacement for resizing images with Next.js used in \<Image> component from `next/image`: https://nextjs.org/docs/pages/api-reference/components/image

## How to deploy
1. Clone the repository
2. Copy `.env.example` to `.env` and fill in the environment variables.
3. Run `docker compose up -d`
5. Use a reverse proxy to expose the service (port `3000`) to the internet.

## How to use
1. In next.config.js add the following:
```javascript
module.exports = {
  images: {
    loader: 'custom',
    loaderFile: './loader.js',
  },
}
```
2. Create a file called `loader.js` in the root of your project and add the following:
```javascript
'use client'
 
export default function myImageLoader({ src, width, quality }) {
  return `https://example.com/image/${src}?w=${width}&q=${quality || 75}`
}
```

Replace `https://example.com/` with the URL of your own.

