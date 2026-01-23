import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // output: 'export' removed to allow dynamic routes (SSR/Client-side) on Netlify
  typescript: { ignoreBuildErrors: true },
  images: { unoptimized: true }
};

export default nextConfig;
