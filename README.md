# Next.js Image Transformation

An open-source & self-hostable image optimization service, a drop-in replacement for Vercel's Image Optimization.

## Cloud with free global CDN

The cloud version, with free global CDN and simple pricing available here: https://images.coollabs.io

## Try it out 

- Change the `width` query parameter to see the image resize on the fly.
- Add the `height` query parameter to see the image crop on the fly.
- Add the `quality` query parameter to see the image quality change on the fly.

https://image.coollabs.io/image/https://cdn.coollabs.io/images/image1.jpg?width=500

## Includes
1. Next Image Transformation API.
   - A simple API written in Bun that transforms the incoming request to Imgproxy format and forwards it to the Imgproxy service.
2. Imgproxy service.
   - A powerful and fast image processing service that can resize, crop, and transform images on the fly.

## How to deploy with Coolify
1. Login to your [Coolify](https://coolify.io) instance or the [cloud](https://app.coolify.io).
2. Create a new service and select the `Next.js Image Transformation` template.
3. Optional: Set the `ALLOWED_REMOTE_DOMAINS` environment variable to the domain of your images (e.g. `example.com,coolify.io`). By default, it is set to `*` which allows any domain.
4. Set the your `<domain>` on the `Next Image Transformation` service.
5. Deploy your service.

## How to use in Next.js
1. In `next.config.js` add the following:
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
    const isLocal = !src.startsWith('http');
    const query = new URLSearchParams();

    const imageOptimizationApi = '<image-optimization-domain>';
    // Your NextJS application URL
    const baseUrl = '<your-nextjs-app-domain>';

    const fullSrc = `${baseUrl}${src}`;

    if (width) query.set('width', width);
    if (quality) query.set('quality', quality);

    if (isLocal && process.env.NODE_ENV === 'development') {
        return src;
    }
    if (isLocal) {
        return `${imageOptimizationApi}/image/${fullSrc}?${query.toString()}`;
    }
    return `${imageOptimizationApi}/image/${src}?${query.toString()}`;
}
```

- Replace `<image-optimization-domain>` with the URL of what you set on the `Next Image Transformation API`.
- Replace `<your-nextjs-app-domain>` with the URL of your Nextjs application.

## Currently supported transformations
- width
- height
- quality
