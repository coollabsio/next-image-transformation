# Next.js Image Transformation

It is a drop-in replacement for resizing images with Next.js used in \<Image> component from `next/image`: https://nextjs.org/docs/pages/api-reference/components/image

## Try it out 

- Change the `width` query parameter to see the image resize on the fly.
- Add the `height` query parameter to see the image crop on the fly.
- Add the `quality` query parameter to see the image quality change on the fly.

https://image.coollabs.io/image/https://cdn.coollabs.io/assets/coolify/og-image-v4.png?width=50

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
  return `https://<domain>/image/${src}?w=${width}&q=${quality || 75}`
}
```

Replace `<domain>` with the URL of what you set on the `Next Image Transformation API`.

## Currently supported transformations
- width
- height
- quality