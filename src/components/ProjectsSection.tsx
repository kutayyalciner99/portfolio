import React from "react";
import { motion } from "framer-motion";
import { ExternalLink } from "lucide-react";
import zekartImage from "@/assets/zek.art.png";

const projects = [
  // Featured projects at the top
  { title: "Yuvam Dünya", description: "Track your carbon footprint, build greener habits, and take real climate action — all from your pocket.", tags: ["Swift", "iOS"], category: "Mobile", link: "/yuvamdunya.html", hasPreview: true },
  { title: "360 NBA", description: "Built for NBA — motorised 360° kiosk for the official exhibition: visitors get a 13-second rotating video clip delivered to their email on the spot.", tags: ["Flutter", "Camera", "Kiosk"], category: "Mobile", link: "/360NBA.html", hasPreview: true },
  { title: "DyMobile", description: "A safe digital world for children: parental control, pattern lock, supervised social feed, and post/follow approval — one app, the whole family.", tags: ["Flutter", "iOS", "Android"], category: "Mobile", link: "/dymobile.html", hasPreview: true },
  // Rest of the projects
  { title: "TarotBloom", description: "Elegant tarot reading app that brings a touch of mystery and reflection to your daily routine.", tags: ["Swift", "iOS"], category: "Mobile", link: "/tarotbloom.html", hasPreview: true },
  { title: "FigureTheDoodle", description: "Draw, guess, and play — a social doodle game that turns quick sketches into fun, competitive rounds.", tags: ["Swift", "iOS"], category: "Mobile", link: "/figurethedoodle.html", hasPreview: true },
  { title: "Zekart", description: "Minimal portfolio site for a photographer — clean layout and striking visuals that let the work speak.", tags: ["Web", "Portfolio"], category: "Web", link: "https://zek.art/", hasPreview: true, previewImage: zekartImage },
  { title: "GoodForYou", description: "AI-powered entrepreneurship coach: GPT-4 chat, voice synthesis, and an animated avatar to guide your journey.", tags: ["Flutter", "Dart", "GPT-4"], category: "Mobile", link: "/goodforyou.html", hasPreview: true },
  { title: "AVROSIS", description: "Authorized e-commerce for original software licenses — Microsoft, Adobe, Autodesk and 50+ brands, with e-invoice and iyzico.", tags: ["Shopify", "E-Commerce", "iyzico"], category: "Web", link: "/avrosis.html", hasPreview: true },
  { title: "Edwai", description: "Your 24/7 AI mentor for micro-entrepreneurs: business plans, market analysis, and financial guidance in your pocket.", tags: ["iOS", "GPT-4", "AI"], category: "Mobile", link: "/edwai.html", hasPreview: true },
  { title: "Roketsan Reservation", description: "Internal room and meeting reservation system for seamless workplace scheduling and capacity management.", tags: ["Flutter", "Dart"], category: "Mobile", link: "/roketsan.html", hasPreview: true },
  { title: "GymRat", description: "Plan workouts, track progress, and stay consistent — your pocket-sized fitness companion.", tags: ["Flutter", "Dart"], category: "Mobile" },
  { title: "Cross-Thrace Connection", description: "EU-funded cross-border app: GIS map, three languages, and cultural heritage across Bulgaria–Turkey Thrace — discover places without borders.", tags: ["Swift", "iOS", "GIS"], category: "Mobile", link: "/crossthrace.html", hasPreview: true },
  { title: "Nerede Mobile", description: "Discover places around you — location-based search and discovery made simple and intuitive.", tags: ["Flutter", "Maps"], category: "Mobile" },
];

const ProjectsSection = () => {
  const [selectedCategory, setSelectedCategory] = React.useState<string | null>(null);

  const categories = ["Mobile", "Web"];
  const filteredProjects = selectedCategory
    ? projects.filter((project) => project.category === selectedCategory)
    : projects;

  return (
    <section id="projects" className="py-20 relative">
      <div className="container mx-auto px-6">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          className="text-center mb-10"
        >
          <p className="font-mono text-primary text-sm tracking-widest uppercase mb-3">My Work</p>
          <h2 className="text-4xl md:text-5xl font-bold mb-8">Portfolio</h2>
          
          {/* Category Filters */}
          <div className="flex justify-center gap-3 flex-wrap">
            <button
              onClick={() => setSelectedCategory(null)}
              className={`px-6 py-2 rounded-full text-sm font-medium transition-all ${
                selectedCategory === null
                  ? "bg-primary text-primary-foreground"
                  : "bg-secondary text-secondary-foreground hover:bg-secondary/80"
              }`}
            >
              All
            </button>
            {categories.map((category) => (
              <button
                key={category}
                onClick={() => setSelectedCategory(category)}
                className={`px-6 py-2 rounded-full text-sm font-medium transition-all ${
                  selectedCategory === category
                    ? "bg-primary text-primary-foreground"
                    : "bg-secondary text-secondary-foreground hover:bg-secondary/80"
                }`}
              >
                {category}
              </button>
            ))}
          </div>
        </motion.div>

        <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
          {filteredProjects.map((project, i) => (
            <motion.div
              key={project.title}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: (i % 6) * 0.05 }}
              className="group glass rounded-2xl overflow-hidden hover:glow-border transition-all duration-500 cursor-pointer"
              onClick={() => {
                if (project.link) {
                  window.open(project.link, '_blank');
                }
              }}
            >
              {/* Preview or Placeholder */}
              <div className="aspect-video bg-secondary/50 flex items-center justify-center overflow-hidden relative group/preview">
                {project.hasPreview && project.link ? (
                  <>
                    {project.previewImage ? (
                      <img
                        src={project.previewImage}
                        alt={`${project.title} preview`}
                        className="absolute inset-0 w-full h-full object-cover"
                      />
                    ) : (
                      <iframe
                        src={project.link}
                        className="absolute inset-0 w-full h-full scale-[0.25] origin-top-left pointer-events-none no-scrollbar"
                        style={{ 
                          width: '400%', 
                          height: '400%',
                          overflow: 'hidden'
                        }}
                        scrolling="no"
                        title={`${project.title} preview`}
                      />
                    )}
                    <div className="absolute inset-0 bg-gradient-to-t from-background/80 via-transparent to-transparent opacity-0 group-hover/preview:opacity-100 transition-opacity" />
                    <div className="absolute bottom-2 right-2 opacity-0 group-hover/preview:opacity-100 transition-opacity">
                      <span className="text-xs font-mono text-primary bg-primary/20 px-2 py-1 rounded">Click to view</span>
                    </div>
                  </>
                ) : (
                  <span className="text-muted-foreground font-mono text-xs">Screenshot coming soon</span>
                )}
              </div>
              <div className="p-6">
                <div className="flex items-center justify-between mb-3">
                  <span className="text-xs font-mono text-primary bg-primary/10 px-3 py-1 rounded-full">
                    {project.category}
                  </span>
                  <ExternalLink className="w-4 h-4 text-muted-foreground opacity-0 group-hover:opacity-100 transition-opacity" />
                </div>
                <h3 className="text-lg font-semibold mb-1">{project.title}</h3>
                <p className="text-muted-foreground text-sm mb-4">{project.description}</p>
                <div className="flex flex-wrap gap-2">
                  {project.tags.map((tag) => (
                    <span key={tag} className="px-2.5 py-0.5 rounded-full text-xs font-mono bg-secondary text-secondary-foreground">
                      {tag}
                    </span>
                  ))}
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default ProjectsSection;
