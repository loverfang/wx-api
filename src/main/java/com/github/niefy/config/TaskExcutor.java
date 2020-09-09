package com.github.niefy.config;

import java.util.concurrent.*;

/**
 * 系统线程池，系统各种任务使用同一个线程池，以防止创建过多线程池
 * 知识点：
 * https://blog.csdn.net/huanyuminhao/article/details/51974171?utm_medium=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param
 */
public class TaskExcutor {

    private TaskExcutor(){}

    /**
     * 使用静态内部类实现单例懒加载
     */
    private static class ExcutorHolder{

        /**
         * 线程池
         * corePoolSize=5 核心线程数
         * maximumPoolSize=30 最大线程数
         * keepAliveTime=10，unit=TimeUnit.SECOND 线程最大空闲时间为10秒
         * workQueue=new SynchronousQueue<Runnable>() 链表队列
         * handler=new ThreadPoolExecutor.CallerRunsPolicy()
         */
        private static final ExecutorService EXCUTOR = new ThreadPoolExecutor(
            5,30,60L, TimeUnit.SECONDS,
            new SynchronousQueue<Runnable>(),
            new ThreadPoolExecutor.CallerRunsPolicy());
    }

    /**
     * 使用静态内部类实现单例懒加载
     */
    private static class SchedulerHolder{
        // ScheduledThreadPoolExecutor 是一个可以实现定时任务的 ThreadPoolExecutor（线程池）。
        private static final ScheduledExecutorService SCHEDULER =
            // 创建一个可缓存的线程池。如果线程池的大小超过了处理任务所需要的线程，那么就会回收部分空闲（60秒不执行任务）的线程，
            // 当任务数增加时，此线程池又可以智能的添加新线程来处理任务。
            // 此线程池不会对线程池大小做限制，线程池大小完全依赖于操作系统（或者说JVM）能够创建的最大线程大小。
            // Executors.newCachedThreadPool();
            // 2、创建一个定长线程池，可控制线程最大并发数，超出的线程会在队列中等待。
            // Executors.newFixedThreadPool(5);
            // 3、创建一个定长线程池，支持定时及周期性任务执行。
            Executors.newScheduledThreadPool(5);
            // 4、创建一个单线程化的线程池，它只会用唯一的工作线程来执行任务，保证所有任务按照指定顺序(FIFO, LIFO, 优先级)执行。
            // Executors.newSingleThreadExecutor();
    }

    /**
     * 将任务提交到系统线程池中执行
     * 1.如果线程数未达核心线程，创建核心线程
     * 2.已达核心线程数，添加到任务队列
     * 3.核心线程已满、队列已满，创建新空闲线程
     * 4.核心线程已满、队列已满、无法创建新空闲线程，执行拒绝策略
     * 本工具类拒绝策略使用内置ThreadPoolExecutor.CallerRunsPolicy，即让添加任务的主线程来执行任务，
     * 这样主线程被占用无法继续添加任务，相当于线程池全满后添加任务的线程会被阻塞
     * @param task
     * @return
     */
    public static Future<?> submit(Runnable task){
        return ExcutorHolder.EXCUTOR.submit(task);
    }

    /**
     * 将定时任务添加到系统线程池
     * @param task
     * @param delay
     * @param unit
     * @return
     */
    public static ScheduledFuture<?> schedule(Runnable task,long delay, TimeUnit unit){
        return SchedulerHolder.SCHEDULER.schedule(task,delay,unit);
    }
}
